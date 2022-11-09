import 'package:camera/camera.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _isLoading = true;
  late List<CameraDescription>? _availableCameras;
  late CameraController _cameraController;
  bool _isRecording = false;
  void _toggleCameraLens() {
    final lensDirection = _cameraController.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.front) {
      newDescription = _availableCameras!.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.back);
    } else {
      newDescription = _availableCameras!.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.front);
    }
    if (newDescription != null) {
      _initCamera(newDescription);
    } else {
      print("Asked camera not available");
    }
  }

  late File _image;
  final picker = ImagePicker();
  // This funcion will helps you to pick and Image from Gallery
  _pickImageFromGallery() async {
    PickedFile? pickedFile = await picker.getVideo(source: ImageSource.gallery);
    File image = File(pickedFile!.path);
    setState(() {
      _image = image;
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(filePath: image.path),
      );
      Navigator.push(context, route);
    });
  }

  _initCamera(CameraDescription description) async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController =
        CameraController(description, ResolutionPreset.max, enableAudio: true);
    try {
      await _cameraController.initialize();
      setState(() => _isLoading = false);
    } catch (e) {
      print(e);
    }
  }

  _recordVideo() async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(filePath: file.path),
      );
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  Future<void> _getAvailableCameras() async {
    WidgetsFlutterBinding.ensureInitialized();
    _availableCameras = await availableCameras();
    _initCamera(_availableCameras!.first);
  }

  @override
  void initState() {
    super.initState();
    _getAvailableCameras();
    inticam();
  }

  void inticam() async {
    await _initCamera(_availableCameras!.first);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ));
    } else {
      return Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CameraPreview(_cameraController),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // RaisedButton(
                  //   color: Colors.red,
                  //   child: Icon(_isRecording ? Icons.stop : Icons.circle),
                  //   onPressed: () => _recordVideo(),
                  // ),
                  FloatingActionButton(
                    heroTag: "btn3",
                    backgroundColor: Color(0xFF6F35A5),
                    child: Icon(Icons.add_a_photo),
                    onPressed: () => _pickImageFromGallery(),
                  ),
                  FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    child: Icon(_isRecording ? Icons.stop : Icons.circle),
                    onPressed: () => _recordVideo(),
                  ),
                  FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: Color(0xFF6F35A5),
                    child: Icon(Icons.repeat),
                    onPressed: () => _toggleCameraLens(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

class VideoPage extends StatefulWidget {
  final String filePath;

  const VideoPage({Key? key, required this.filePath}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        elevation: 0,
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async {
              await GallerySaver.saveVideo(widget.filePath);
              File(widget.filePath).deleteSync();
              print('do something with the file');
              Navigator.pop(context);
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: _initVideoPlayer(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return VideoPlayer(_videoPlayerController);
          }
        },
      ),
    );
  }
}

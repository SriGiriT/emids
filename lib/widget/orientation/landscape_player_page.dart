
  
// import 'package:auto_orientation/auto_orientation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:esquarr/main.dart';
// import 'package:esquarr/widget/orientation/video_player_fullscreen_widget.dart';
// import 'package:video_player/video_player.dart';
// import 'package:wakelock/wakelock.dart';

// class LandscapePlayerPage extends StatefulWidget {
//   @override
//   _LandscapePlayerPageState createState() => _LandscapePlayerPageState();
// }

// class _LandscapePlayerPageState extends State<LandscapePlayerPage> {
//   late VideoPlayerController controller;

//   @override
//   void initState() {
//     super.initState();

//     controller = VideoPlayerController.network('https://firebasestorage.googleapis.com/v0/b/web-johannesmilke.appspot.com/o/ezgif-7-565b5237f95f.mp4?alt=media&token=51e8e031-1e87-46e6-bd32-98c5367da59d')
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((_) => controller.play());

//     setLandscape();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     setAllOrientations();

//     super.dispose();
//   }

//   Future setLandscape() async {
//     // hide overlays statusbar
//     await SystemChrome.setEnabledSystemUIOverlays([]);
//     await SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.landscapeRight,
//     ]);

//     await Wakelock.enable(); // keep device awake
//   }

//   Future setAllOrientations() async {
//     await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//     await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

//     await Wakelock.disable();
//   }

//   @override
//   Widget build(BuildContext context) =>
//       VideoPlayerFullscreenWidget(controller: controller);
// }
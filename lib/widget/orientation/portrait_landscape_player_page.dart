// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:esquarr/main.dart';
// import 'package:esquarr/widget/orientation/video_player_both_widget.dart';
// import 'package:esquarr/widget/orientation/video_player_fullscreen_widget.dart';
// import 'package:video_player/video_player.dart';
// import 'package:wakelock/wakelock.dart';

// class PortraitLandscapePlayerPage extends StatefulWidget {
//   @override
//   _PortraitLandscapePlayerPageState createState() =>
//       _PortraitLandscapePlayerPageState();
// }

// class _PortraitLandscapePlayerPageState
//     extends State<PortraitLandscapePlayerPage> {
//   late VideoPlayerController controller;

//   @override
//   void initState() {
//     super.initState();

//     controller = VideoPlayerController.network('https://firebasestorage.googleapis.com/v0/b/web-johannesmilke.appspot.com/o/ezgif-7-565b5237f95f.mp4?alt=media&token=51e8e031-1e87-46e6-bd32-98c5367da59d')
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((_) => controller.play());
//   }

//   @override
//   void dispose() {
//     controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(toolbarHeight: 0),
//         body: VideoPlayerBothWidget(controller: controller),
//       );
// }
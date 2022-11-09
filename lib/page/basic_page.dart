import 'package:flutter/material.dart';
import 'package:emids/widget/basics/asset_player_widget.dart';
import 'package:emids/widget/other/tabbar_widget.dart';
import 'package:emids/widget/basics/file_player_widget.dart';
import 'package:emids/widget/basics/network_player_widget.dart';
import 'package:emids/camera_page.dart';
import 'package:emids/screen/screen.dart';
import 'package:emids/profile/prof_page.dart';

class BasicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        tabs: [
          Tab(icon: Icon(Icons.video_camera_front_rounded), text: 'Record'),
          Tab(icon: Icon(Icons.file_copy), text: 'File'),
          Tab(icon: Icon(Icons.person), text: 'Profile'),
        ],
        onTap: (int value) {},
        children: [
          buildAssets(),
          buildFiles(context),
          buildNetwork(),
        ],
      );

  Widget buildAssets() => CameraPage();

  Widget buildFiles(BuildContext context) => TasksScreen();

  Widget buildNetwork() => ProfilePage();
}

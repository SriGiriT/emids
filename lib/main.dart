import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emids/sour/task_data.dart';
import 'package:emids/screen/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Esquar",
        theme: ThemeData(
          primaryColor: Color(0xFF6F35A5),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: VideoPlayer(),
      ),
    );
  }
}

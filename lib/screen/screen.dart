import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:emids/widget/task_list.dart';
import 'package:emids/widget/bottomPopUp.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:emids/sour/task_data.dart';
import 'package:open_file/open_file.dart';
import 'package:emids/files_page.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void openFiles(List<PlatformFile> files) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FilesPage(
            files: files,
            onOpenedFile: openFile,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF6F35A5),
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await FilePicker.platform.pickFiles(
            allowMultiple: true,
            type: FileType.video,
          );
          openFiles(result!.files);
          // if (result == null) return;
          // open single file
          // final file = result.files.first;
          // print('Name: ${file.name}');
          // print('Bytes: ${file.bytes}');
          // print('Size: ${file.size}');
          // print('Extension: ${file.extension}');
          // print('Path: ${file.path}');
          // final newFile = await saveFilePermanently(file);
          // print('From Path: ${file.path!}');
          // print('To path: ${newFile.path}');
          // openFile(file);
          // openFiles(result.files);
          // showModalBottomSheet(context: context, builder: (context)=>BottomPopUpBox());
        },
      ),
      backgroundColor: Color(0xFF6F35A5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          // padding: EdgeInsets.only(left: 40, top: 60, right: 30, bottom: 30),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          // CircleAvatar(child: Icon(Icons.list, size: 30,color: Color(0xFF6F35A5),),
          //     backgroundColor: Colors.white,
          //     radius: 30),
          // SizedBox(
          //   height: 10,
          // ),
          // Text('Esquar', style: TextStyle(
          //     fontSize: 50,
          //     fontWeight: FontWeight.w700,
          //     color: Colors.white
          // ),),
          // Text(
          //   "Recorded videos",
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 18
          //   ),
          // )
          // ],
          // ),
          // ),
          Container(
            height: 100,
            width: double.infinity,
            color: Color.fromARGB(31, 255, 0, 0),
          ),
          Expanded(
            child: Container(
              child: Padding(padding: EdgeInsets.all(10), child: TaskList()),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:emids/sour/task_data.dart';
import 'package:provider/provider.dart';

late String newTasks;

class BottomPopUpBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(),
              Text(
                'Add Task',
                style: TextStyle(fontSize: 30, color: Color(0xFF6F35A5)),
                textAlign: TextAlign.center,
              ),
              TextField(
                cursorHeight: 20,
                onChanged: (value) {
                  newTasks = value;
                },
                textAlign: TextAlign.center,
                autofocus: true,
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  // Provider.of<TaskData>(context, listen: false).addNewTask(newTasks);
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

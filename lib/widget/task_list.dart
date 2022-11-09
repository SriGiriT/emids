import 'package:flutter/material.dart';
import 'package:emids/widget/tile_task.dart';
import 'package:provider/provider.dart';
import 'package:emids/sour/task_data.dart';


class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
      itemCount: taskData.taskCount,
      itemBuilder: (context, index) {
        final task = taskData.tasks[index];
        return ListOfTile(
          listTitle: task.title,
          isChecked: task.isDone,
          toggleTheCheckBox: (newValue) {
            taskData.updateList(task);
          },
          longPressed: (){
            taskData.deleteTask(task);
          },
        );
      },
    )
    );
  }
}


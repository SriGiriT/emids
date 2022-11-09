import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:emids/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addNewTask(String newTask) {
    _tasks.add(Task(title: newTask));
    notifyListeners();
  }

  void updateList(Task taskToUpdate) {
    taskToUpdate.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task taskToDelete) {
    _tasks.remove(taskToDelete);
    notifyListeners();
  }

  void convertVideo(Task taskToConvert) {
    
    notifyListeners();
  }
}

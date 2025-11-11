import 'package:ecomerce_n8n/domain/entities/task.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> tasks = [];

  addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void toogleTaskStatus(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }
}

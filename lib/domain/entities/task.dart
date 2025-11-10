import 'package:flutter/material.dart';

class Task {
  final String title;
  final String category;
  final DateTime date;
  final TimeOfDay time;
  final String? note;
  final bool isCompleted;

  Task({
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    this.note,
    this.isCompleted = false,
  });
}

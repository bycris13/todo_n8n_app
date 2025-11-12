import 'package:dio/dio.dart';
import 'package:ecomerce_n8n/domain/entities/task.dart';
import 'package:flutter/material.dart';

class N8nService {
  final dio = Dio();

  Future<bool> sendTask(Task task, BuildContext context) async {
    try {
      final response = await dio.post(
        'https://bycris13.app.n8n.cloud/webhook-test/create-task',
        data: {
          'title': task.title,
          'category': task.category,
          'date': task.date.toIso8601String(),
          'time': task.time.format(context),
          'note': task.note,
          'isCompleted': task.isCompleted,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}

import 'package:ecomerce_n8n/domain/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskDetailScreen extends StatelessWidget {
  static const name = 'task-detail';
  final Task task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: colors.primary.withOpacity(0.1),
                  child: Icon(task.icon, color: colors.primary),
                ),
                const SizedBox(width: 10),
                Text(
                  task.category,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '📅 Date: ${DateFormat('MMM dd, yyyy').format(task.date)}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '⏰ Time: ${task.time.format(context)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              '📝 Note:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('${task.note}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            task.isCompleted
                ? Text('Completed ✅', style: const TextStyle(fontSize: 16))
                : Text('The task is not yet coplete'),
          ],
        ),
      ),
    );
  }
}

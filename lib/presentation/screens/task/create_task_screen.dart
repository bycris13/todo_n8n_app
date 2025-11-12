import 'package:ecomerce_n8n/domain/entities/task.dart';
import 'package:ecomerce_n8n/infrastructure/services/n8n_service.dart';
import 'package:ecomerce_n8n/presentation/providers/task_provider.dart';
import 'package:ecomerce_n8n/presentation/widgets/common_text_field.dart';
import 'package:ecomerce_n8n/presentation/widgets/save_task_button.dart';
import 'package:ecomerce_n8n/presentation/widgets/select_category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreateTaskScreen extends StatefulWidget {
  static const name = 'create-task';
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  String selectedCategory = 'Work';
  IconData selectedIcon = Icons.work;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Método para seleccionar fecha
  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2090),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = DateFormat('MMM dd, yyyy').format(pickedDate);
      });
    }
  }

  // Método para seleccionar hora
  Future<void> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        timeController.text = pickedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Formateo de fecha y hora para mostrar en los campos
    final formattedDate = selectedDate != null
        ? DateFormat('MMM dd, yyyy').format(selectedDate!)
        : 'Select date';
    final formattedTime = selectedTime != null
        ? selectedTime!.format(context)
        : 'Select time';

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Task', style: TextStyle(color: Colors.white)),
        backgroundColor: colors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // Task title
            CommonTextField(
              labelText: 'Text Title',
              label: 'Task title',
              controller: titleController,
              readOnly: false,
            ),

            // Category
            SelectCategory(
              onCategorySelected: (category, icon) {
                setState(() {
                  selectedCategory = category;
                  selectedIcon = icon;
                });
              },
            ),
            const SizedBox(height: 20),

            // Date & Time
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    labelText: 'Date',
                    label: formattedDate,
                    controller: dateController,
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () => _selectDate(context),
                      icon: const Icon(Icons.date_range_sharp),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CommonTextField(
                    labelText: 'Time',
                    label: formattedTime,
                    readOnly: true,
                    controller: timeController,
                    suffixIcon: IconButton(
                      onPressed: () => _selectTime(context),
                      icon: const Icon(Icons.schedule),
                    ),
                  ),
                ),
              ],
            ),

            // Note
            CommonTextField(
              labelText: 'Note',
              label: 'Task Note',
              controller: noteController,
              readOnly: false,
              maxLines: 10,
            ),

            const SizedBox(height: 20),

            // Save button
            SaveTaskButton(
              onSave: () async {
                final task = Task(
                  title: titleController.text,
                  category: selectedCategory,
                  date: selectedDate!,
                  time: selectedTime!,
                  icon: selectedIcon,
                  note: noteController.text,
                );
                Provider.of<TaskProvider>(context, listen: false).addTask(task);

                final n8nService = N8nService();
                final success = await n8nService.sendTask(task, context);

                if (!mounted)
                  return; // 👈 evita usar context si el widget ya se desmontó

                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Task synced with n8n ✅')),
                  );
                  Navigator.pop(context); // volver a HomeScreen
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to sync task ❌')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

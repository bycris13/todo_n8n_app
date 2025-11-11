import 'package:ecomerce_n8n/presentation/widgets/common_text_field.dart';
import 'package:ecomerce_n8n/presentation/widgets/save_task_button.dart';
import 'package:ecomerce_n8n/presentation/widgets/select_category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTaskScreen extends StatefulWidget {
  static const name = 'create-task';
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
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
            const CommonTextField(labelText: 'Text Title', label: 'Task title'),

            // Category
            SelectCategory(),
            const SizedBox(height: 20),

            // Date & Time
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    labelText: 'Date',
                    label: formattedDate,
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
                    suffixIcon: IconButton(
                      onPressed: () => _selectTime(context),
                      icon: const Icon(Icons.schedule),
                    ),
                  ),
                ),
              ],
            ),

            // Note
            const CommonTextField(
              labelText: 'Note',
              label: 'Task Note',
              maxLines: 10,
            ),

            const SizedBox(height: 20),

            // Save button
            const SaveTaskButton(),
          ],
        ),
      ),
    );
  }
}

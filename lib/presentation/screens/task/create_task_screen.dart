import 'package:ecomerce_n8n/presentation/widgets/common_text_field.dart';
import 'package:ecomerce_n8n/presentation/widgets/save_task_button.dart';
import 'package:ecomerce_n8n/presentation/widgets/select_category.dart';
import 'package:flutter/material.dart';

class CreateTaskScreen extends StatelessWidget {
  static const name = 'create-task';
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Task', style: TextStyle(color: Colors.white)),
        backgroundColor: colors.primary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // Task title
            CommonTextField(labelText: 'Text Title', label: 'Task title'),
            // Category
            SelectCategory(),
            SizedBox(height: 20),
            // Date & Time
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    labelText: 'Date',
                    label: 'Nov 09',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.date_range_sharp),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CommonTextField(
                    labelText: 'Times',
                    label: '3:20',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _selectedDate(context);
                      },
                      icon: IconButton(
                        onPressed: () {
                          _selectedTime(context);
                        },
                        icon: Icon(Icons.schedule),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Note
            CommonTextField(
              labelText: 'Note',
              label: 'Task Note',
              maxLines: 10,
            ),

            SaveTaskButton(),
          ],
        ),
      ),
    );
  }
}

void _selectedTime(BuildContext context) async {
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (pickedTime != null) {}
}

void _selectedDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2025),
    lastDate: DateTime(2090),
  );

  if (pickedDate != null) {}
}

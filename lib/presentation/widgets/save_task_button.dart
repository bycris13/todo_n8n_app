import 'package:flutter/material.dart';

class SaveTaskButton extends StatelessWidget {
  final VoidCallback onSave; // 👈 función que se ejecuta al guardar

  const SaveTaskButton({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: () async {
        final email = await showDialog<String>(
          context: context,
          builder: (context) {
            final controller = TextEditingController();

            return AlertDialog(
              title: const Text('Enter your email to save the task'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  hintText: 'example@gmail.com',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, controller.text);
                  },
                  child: const Text('OK'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );

        if (email != null && email.contains('@')) {
          onSave(); // 👈 ejecuta la lógica de guardar
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Task added for $email')));
          Navigator.pop(context); // 👈 vuelve a HomeScreen
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter a valid email')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: const Text(
        'Save Task',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

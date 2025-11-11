import 'package:flutter/material.dart';

class SaveTaskButton extends StatelessWidget {
  const SaveTaskButton({super.key});

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
              title: const Text('Enter your email'),
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
                    Navigator.pop(
                      context,
                      controller.text,
                    ); // Devuelve el texto
                  },
                  child: const Text('OK'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Cierra sin devolver nada
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );

        if (email != null && email.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Task added for $email')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter your email')),
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
        'Add New Task',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

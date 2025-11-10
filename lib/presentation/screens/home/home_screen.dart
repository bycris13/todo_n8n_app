import 'package:ecomerce_n8n/presentation/widgets/task_panel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;
    final formatedDate = DateFormat('MMM dd, yyyy').format(DateTime.now());
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Encabezado morado
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatedDate,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'My Todo List',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),

            // Tasks
            TaskPanel(screenWidth: screenWidth, top: 170, child: Text('Task')),

            Positioned(
              top: 540,
              left: 0,
              right: 290,
              child: Center(
                child: Text(
                  'Completed',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Tareas completadas
            TaskPanel(screenWidth: screenWidth, top: 580, child: Text('Task')),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/task');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

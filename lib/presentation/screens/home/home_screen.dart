import 'package:ecomerce_n8n/presentation/providers/task_provider.dart';
import 'package:ecomerce_n8n/presentation/screens/details/task_detail_screen.dart';
import 'package:ecomerce_n8n/presentation/widgets/task_panel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

            // Contenido dinámico de tareas
            Consumer<TaskProvider>(
              builder: (context, provider, _) {
                final activeTasks = provider.tasks
                    .where((t) => !t.isCompleted)
                    .toList();
                final completedTasks = provider.tasks
                    .where((t) => t.isCompleted)
                    .toList();

                return Stack(
                  children: [
                    // Panel de tareas activas
                    TaskPanel(
                      screenWidth: screenWidth,
                      top: 170,
                      child: ListView.builder(
                        itemCount: activeTasks.length,
                        itemBuilder: (context, index) {
                          final task = activeTasks[index];
                          return Card(
                            elevation: 1,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: ListTile(
                              onTap: () {
                                context.pushNamed(
                                  TaskDetailScreen.name,
                                  extra: task,
                                );
                              },
                              leading: CircleAvatar(
                                backgroundColor: colors.primary.withOpacity(
                                  0.15,
                                ),
                                child: Icon(task.icon, color: colors.primary),
                              ),
                              title: Text(
                                task.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '${task.category} • ${DateFormat('MMM dd').format(task.date)} • ${task.time.format(context)}',
                              ),
                              trailing: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                value: task.isCompleted,
                                onChanged: (value) {
                                  provider.toogleTaskStatus(task);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Texto "Completed"
                    const Positioned(
                      top: 540,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Completed',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Panel de tareas completadas
                    TaskPanel(
                      screenWidth: screenWidth,
                      top: 580,
                      child: ListView.builder(
                        itemCount: completedTasks.length,
                        itemBuilder: (context, index) {
                          final task = completedTasks[index];
                          return Card(
                            elevation: 1,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: ListTile(
                              onTap: () {
                                context.pushNamed(
                                  TaskDetailScreen.name,
                                  extra: task,
                                );
                              },
                              leading: CircleAvatar(
                                backgroundColor: Colors.green.withOpacity(0.15),
                                child: Icon(task.icon, color: Colors.green),
                              ),
                              title: Text(
                                task.title,
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                              subtitle: Text(
                                '${task.category} • ${DateFormat('MMM dd').format(task.date)} • ${task.time.format(context)}',
                              ),
                              trailing: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                value: task.isCompleted,
                                onChanged: (value) {
                                  provider.toogleTaskStatus(task);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/task'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

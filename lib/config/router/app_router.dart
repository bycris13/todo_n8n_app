import 'package:ecomerce_n8n/domain/entities/task.dart';
import 'package:ecomerce_n8n/presentation/screens/details/task_detail_screen.dart';
import 'package:ecomerce_n8n/presentation/screens/home/home_screen.dart';
import 'package:ecomerce_n8n/presentation/screens/task/create_task_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      path: '/task',
      name: CreateTaskScreen.name,
      builder: (context, state) => CreateTaskScreen(),
    ),

    GoRoute(
      path: '/task-detail',
      name: TaskDetailScreen.name,
      builder: (context, state) {
        // Recibimos la tarea desde el extra
        final task = state.extra as Task;
        return TaskDetailScreen(task: task);
      },
    ),
  ],
);

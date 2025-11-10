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
  ],
);

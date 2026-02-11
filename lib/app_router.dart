import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/task_list_screen.dart';
import 'screens/task_detail_screen.dart';
import 'screens/task_form_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes {
    return {
      '/home_screen': (context) => const HomeScreen(),
      '/task_list_screen': (context) => const TaskListScreen(),
      '/task_detail_screen': (context) => const TaskDetailScreen(),
      '/task_form_screen': (context) => const TaskFormScreen(),
      '/login_screen': (context) => const LoginScreen(),
      '/register_screen': (context) => const RegisterScreen(),
      '/settings_screen': (context) => const SettingsScreen(),
      '/': (context) => const LoginScreen(),
      '/login': (context) => const LoginScreen(),
      '/register': (context) => const RegisterScreen(),
    };
  }
}

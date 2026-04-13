import 'package:flutter/material.dart';
import 'screens/user/template_selection_screen.dart';
import 'screens/user/resume_builder_screen.dart';
import 'screens/admin/admin_login_screen.dart';
import 'screens/admin/admin_dashboard_screen.dart';

void main() {
  runApp(const ATSifyApp());
}

class ATSifyApp extends StatelessWidget {
  const ATSifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATSify',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TemplateSelectionScreen(),
        '/builder': (context) => const ResumeBuilderScreen(),
        '/admin-login': (context) => const AdminLoginScreen(),
        '/admin-dashboard': (context) => const AdminDashboardScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

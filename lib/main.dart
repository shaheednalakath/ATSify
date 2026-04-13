import 'package:flutter/material.dart';
import 'screens/user/home_screen.dart';
import 'screens/user/builder_screen.dart';
import 'screens/admin/admin_login_screen.dart';
import 'screens/admin/admin_dashboard_screen.dart';

void main() {
  // Entry point of the Flutter app
  runApp(const ATSifyApp());
}

class ATSifyApp extends StatelessWidget {
  const ATSifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATSify Resume Builder',
      theme: ThemeData(
        // Material 3 provides modern looking components
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Define basic navigation routes using a Map
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/builder': (context) => const BuilderScreen(),
        '/admin-login': (context) => const AdminLoginScreen(),
        '/admin-dashboard': (context) => const AdminDashboardScreen(),
      },
      // Hide the debug banner in the top right
      debugShowCheckedModeBanner: false,
    );
  }
}

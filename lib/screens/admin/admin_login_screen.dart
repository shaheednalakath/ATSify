import 'package:flutter/material.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Admin Login Form', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            // Mock login button to enter the dashboard
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/admin-dashboard'),
              child: const Text('Login as Admin (Mock)'),
            ),
          ],
        ),
      ),
    );
  }
}

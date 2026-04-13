import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATSify - Select Template'),
        actions: [
          // Icon button to navigate to Admin area
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () => Navigator.pushNamed(context, '/admin-login'),
            tooltip: 'Admin Login',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select a Template to Start',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Button to go to the builder screen
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/builder'),
              child: const Text('Go to Resume Builder'),
            ),
          ],
        ),
      ),
    );
  }
}

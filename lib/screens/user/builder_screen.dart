import 'package:flutter/material.dart';

class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder'),
      ),
      body: const Center(
        child: Text(
          'Form & Preview will go here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

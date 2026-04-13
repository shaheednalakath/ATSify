import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/resume_provider.dart';

class ResumeBuilderScreen extends StatelessWidget {
  const ResumeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${resumeProvider.resumeData.name.isEmpty ? "Not Set" : resumeProvider.resumeData.name}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${resumeProvider.resumeData.email.isEmpty ? "Not Set" : resumeProvider.resumeData.email}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Selected Template: ${resumeProvider.selectedTemplate}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                resumeProvider.updateName('John Doe');
              },
              child: const Text('Update Name (Test)'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                resumeProvider.updateEmail('john.doe@example.com');
              },
              child: const Text('Update Email (Test)'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                resumeProvider.changeTemplate('modern');
              },
              child: const Text('Change Template (Test)'),
            ),
          ],
        ),
      ),
    );
  }
}

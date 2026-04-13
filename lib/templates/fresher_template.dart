import 'package:flutter/material.dart';
import '../models/resume_model.dart';

class FresherTemplate extends StatelessWidget {
  final ResumeModel data;

  const FresherTemplate({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.person, size: 64, color: Colors.grey),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name.isEmpty ? 'Your Name' : data.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Text(data.email),
                  Text(data.phone),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.grey[200],
          width: double.infinity,
          child: const Text('Objective', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        Text(data.summary.isEmpty ? 'Seeking an entry level role...' : data.summary),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.grey[200],
          width: double.infinity,
          child: const Text('Skills & Abilities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        ...data.skills.map((skill) => Text('• $skill')),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../models/resume_model.dart';

class ModernTemplate extends StatelessWidget {
  final ResumeModel data;

  const ModernTemplate({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.name.isEmpty ? 'Your Name' : data.name,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        const SizedBox(height: 8),
        Text('${data.email} • ${data.phone}'),
        const Divider(height: 32, thickness: 2),
        const Text('Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(data.summary.isEmpty ? 'Your professional summary...' : data.summary),
        const SizedBox(height: 24),
        const Text('Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: data.skills.map((skill) => Chip(label: Text(skill))).toList(),
        ),
      ],
    );
  }
}

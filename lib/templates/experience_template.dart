import 'package:flutter/material.dart';
import '../models/resume_model.dart';

class ExperienceTemplate extends StatelessWidget {
  final ResumeModel data;

  const ExperienceTemplate({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.name.isEmpty ? 'Your Name' : data.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text('${data.email} | ${data.phone}'),
        const Divider(thickness: 2),
        const SizedBox(height: 12),
        const Text(
          'PROFESSIONAL EXPERIENCE',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('• Placeholder Company - Software Engineer (2020-Present)'),
        const Text('• Placeholder Corp - Junior Analyst (2018-2020)'),
        const SizedBox(height: 24),
        const Text(
          'SUMMARY',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(data.summary.isEmpty ? 'Your summary goes here...' : data.summary),
        const SizedBox(height: 24),
        const Text(
          'SKILLS',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(data.skills.isEmpty ? 'Skill 1, Skill 2' : data.skills.join(' • ')),
      ],
    );
  }
}

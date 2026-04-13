import 'package:flutter/material.dart';
import '../models/resume_model.dart';

class SkillsTemplate extends StatelessWidget {
  final ResumeModel data;

  const SkillsTemplate({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            data.name.isEmpty ? 'Your Name' : data.name,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('${data.email}    ${data.phone}'),
        ),
        const SizedBox(height: 24),
        const Align(
          alignment: Alignment.centerRight,
          child: Text('CORE COMPETENCIES', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const Divider(),
        Wrap(
          spacing: 12.0,
          alignment: WrapAlignment.end,
          children: data.skills.isEmpty 
            ? [const Text('No skills provided')] 
            : data.skills.map((s) => Text(s, style: const TextStyle(fontWeight: FontWeight.bold))).toList(),
        ),
        const SizedBox(height: 24),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('PROFESSIONAL SUMMARY', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const Divider(),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(data.summary.isEmpty ? 'Your professional summary...' : data.summary),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../models/resume_model.dart';

class ClassicTemplate extends StatelessWidget {
  final ResumeModel data;

  const ClassicTemplate({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          data.name.isEmpty ? 'YOUR NAME' : data.name.toUpperCase(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text('${data.email} | ${data.phone}', textAlign: TextAlign.center),
        const SizedBox(height: 24),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('SUMMARY', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
        ),
        const Divider(color: Colors.black, thickness: 1),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(data.summary.isEmpty ? 'Your professional summary...' : data.summary),
        ),
        const SizedBox(height: 24),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('SKILLS', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
        ),
        const Divider(color: Colors.black, thickness: 1),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(data.skills.join(', ')),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../models/resume_model.dart';

class CompactTemplate extends StatelessWidget {
  final ResumeModel data;

  const CompactTemplate({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.name.isEmpty ? 'YOUR NAME' : data.name.toUpperCase(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('${data.email} | ${data.phone}', style: const TextStyle(fontSize: 12)),
          ],
        ),
        const Divider(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('SKILLS: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            Expanded(
              child: Text(
                data.skills.join(', '),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const Divider(height: 16),
        const Text('SUMMARY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          data.summary.isEmpty ? 'Your summary...' : data.summary,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

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
        // ── Header ──────────────────────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                data.name.isEmpty ? 'YOUR NAME' : data.name.toUpperCase(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (data.email.isNotEmpty)
                  Text(data.email, style: const TextStyle(fontSize: 10)),
                if (data.phone.isNotEmpty)
                  Text(data.phone, style: const TextStyle(fontSize: 10)),
                if (data.location.isNotEmpty)
                  Text(data.location, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
        const Divider(height: 12, thickness: 1),

        // ── Skills Trace ────────────────────────────────────────────────────
        if (data.skills.isNotEmpty) ...[
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 11, color: Colors.black),
              children: [
                const TextSpan(text: 'SKILLS: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: data.skills.join(', ')),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],

        // ── Summary ─────────────────────────────────────────────────────────
        if (data.summary.isNotEmpty) ...[
          const Text('SUMMARY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          const SizedBox(height: 2),
          Text(data.summary, style: const TextStyle(fontSize: 10)),
          const SizedBox(height: 12),
        ],

        // ── Experience ──────────────────────────────────────────────────────
        if (data.experience.isNotEmpty) ...[
          const Text('EXPERIENCE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          const Divider(height: 8),
          ...data.experience.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.jobTitle,
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 10)),
                        Text(e.duration, style: const TextStyle(fontSize: 9, color: Colors.black54)),
                      ],
                    ),
                    Text(e.company, style: const TextStyle(fontSize: 9, color: Colors.black54)),
                  ],
                ),
              )),
          const SizedBox(height: 8),
        ],

        // ── Projects ────────────────────────────────────────────────────────
        if (data.projects.isNotEmpty) ...[
          const Text('PROJECTS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          const Divider(height: 8),
          ...data.projects.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 10)),
                    if (p.description.isNotEmpty)
                      Text(p.description, style: const TextStyle(fontSize: 9)),
                  ],
                ),
              )),
          const SizedBox(height: 8),
        ],

        // ── Education ───────────────────────────────────────────────────────
        if (data.education.isNotEmpty) ...[
          const Text('EDUCATION', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          const Divider(height: 8),
          ...data.education.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('${e.degree}, ${e.institution}',
                          style: const TextStyle(fontSize: 10)),
                    ),
                    Text(e.year, style: const TextStyle(fontSize: 9, color: Colors.black54)),
                  ],
                ),
              )),
        ],
      ],
    );
  }
}


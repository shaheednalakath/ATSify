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
        // ── Header ──────────────────────────────────────────────────────────
        Text(
          data.name.isEmpty ? 'Your Name' : data.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          [
            if (data.email.isNotEmpty) data.email,
            if (data.phone.isNotEmpty) data.phone,
            if (data.location.isNotEmpty) data.location,
          ].join(' | '),
          style: const TextStyle(fontSize: 12),
        ),
        const Divider(thickness: 2),

        // ── Experience ──────────────────────────────────────────────────────
        if (data.experience.isNotEmpty) ...[
          const SizedBox(height: 12),
          const Text(
            'PROFESSIONAL EXPERIENCE',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...data.experience.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.jobTitle,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        Text(e.duration, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                      ],
                    ),
                    Text(e.company,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87)),
                    if (e.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(e.description, style: const TextStyle(fontSize: 11)),
                      ),
                  ],
                ),
              )),
        ],

        // ── Summary ─────────────────────────────────────────────────────────
        if (data.summary.isNotEmpty) ...[
          const SizedBox(height: 12),
          const Text(
            'SUMMARY',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(data.summary, style: const TextStyle(fontSize: 12)),
        ],

        // ── Skills ──────────────────────────────────────────────────────────
        if (data.skills.isNotEmpty) ...[
          const SizedBox(height: 12),
          const Text(
            'SKILLS',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(data.skills.join(' • '), style: const TextStyle(fontSize: 12)),
        ],

        // ── Education ───────────────────────────────────────────────────────
        if (data.education.isNotEmpty) ...[
          const SizedBox(height: 24),
          const Text(
            'EDUCATION',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...data.education.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.degree,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        Text(e.year, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                      ],
                    ),
                    Text(e.institution, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              )),
        ],

        // ── Projects ────────────────────────────────────────────────────────
        if (data.projects.isNotEmpty) ...[
          const SizedBox(height: 24),
          const Text(
            'PROJECTS',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...data.projects.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    if (p.description.isNotEmpty)
                      Text(p.description, style: const TextStyle(fontSize: 11)),
                  ],
                ),
              )),
        ],
      ],
    );
  }
}


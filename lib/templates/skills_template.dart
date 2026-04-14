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
        // ── Header ──────────────────────────────────────────────────────────
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            data.name.isEmpty ? 'Your Name' : data.name,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            [
              if (data.email.isNotEmpty) data.email,
              if (data.phone.isNotEmpty) data.phone,
              if (data.location.isNotEmpty) data.location,
            ].join('    '),
          ),
        ),
        const SizedBox(height: 24),

        // ── Skills Trace ────────────────────────────────────────────────────
        const Align(
          alignment: Alignment.centerRight,
          child:
              Text('CORE COMPETENCIES', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const Divider(),
        Wrap(
          spacing: 12.0,
          alignment: WrapAlignment.end,
          children: data.skills.isEmpty
              ? [const Text('No skills provided')]
              : data.skills
                  .map((s) => Text(s, style: const TextStyle(fontWeight: FontWeight.bold)))
                  .toList(),
        ),
        const SizedBox(height: 24),

        // ── Summary ─────────────────────────────────────────────────────────
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('PROFESSIONAL SUMMARY',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const Divider(),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(data.summary, style: const TextStyle(fontSize: 12)),
        ),
        const SizedBox(height: 24),

        // ── Experience ──────────────────────────────────────────────────────
        if (data.experience.isNotEmpty) ...[
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('WORK EXPERIENCE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const Divider(),
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
                    Text(e.company, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                    if (e.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(e.description, style: const TextStyle(fontSize: 11)),
                      ),
                  ],
                ),
              )),
          const SizedBox(height: 12),
        ],

        // ── Education & Projects ──────────────────────────────────────────────
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.education.isNotEmpty)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('EDUCATION',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    const Divider(),
                    ...data.education.map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.degree,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                              Text(e.institution, style: const TextStyle(fontSize: 11)),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            if (data.education.isNotEmpty && data.projects.isNotEmpty) const SizedBox(width: 24),
            if (data.projects.isNotEmpty)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('PROJECTS',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    const Divider(),
                    ...data.projects.map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(p.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                              if (p.description.isNotEmpty)
                                Text(p.description,
                                    style: const TextStyle(fontSize: 10),
                                    textAlign: TextAlign.right),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}


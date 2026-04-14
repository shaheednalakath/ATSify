import 'package:flutter/material.dart';
import '../models/resume_model.dart';

class FresherTemplate extends StatelessWidget {
  final ResumeModel data;

  const FresherTemplate({super.key, required this.data});

  static const Color _accent = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ────────────────────────────────────────────────────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          color: Colors.teal.shade50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name.isEmpty ? 'Your Name' : data.name,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: _accent),
              ),
              const SizedBox(height: 4),
              Text(
                [
                  if (data.email.isNotEmpty) data.email,
                  if (data.phone.isNotEmpty) data.phone,
                  if (data.location.isNotEmpty) data.location,
                ].join('  |  '),
                style: const TextStyle(fontSize: 11, color: Colors.black54),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // ── Objective ─────────────────────────────────────────────────────
        if (data.summary.isNotEmpty) ...[
          _sectionHead('Objective'),
          const SizedBox(height: 6),
          Text(data.summary, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 16),
        ],

        // ── Skills ────────────────────────────────────────────────────────
        if (data.skills.isNotEmpty) ...[
          _sectionHead('Skills & Abilities'),
          const SizedBox(height: 6),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: data.skills
                .map((s) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.teal.shade200),
                      ),
                      child: Text(s, style: const TextStyle(fontSize: 11)),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
        ],

        // ── Projects ──────────────────────────────────────────────────────
        if (data.projects.isNotEmpty) ...[
          _sectionHead('Projects'),
          const SizedBox(height: 6),
          ...data.projects.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(p.name,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: _accent)),
                  if (p.technologies.isNotEmpty)
                    Text('Tech: ${p.technologies}',
                        style: const TextStyle(fontSize: 11, color: Colors.black54)),
                  if (p.description.isNotEmpty)
                    Text(p.description, style: const TextStyle(fontSize: 11)),
                  if (p.link.isNotEmpty)
                    Text(p.link, style: const TextStyle(fontSize: 11, color: Colors.blue)),
                ]),
              )),
        ],

        // ── Education ─────────────────────────────────────────────────────
        if (data.education.isNotEmpty) ...[
          _sectionHead('Education'),
          const SizedBox(height: 6),
          ...data.education.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(e.degree,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    if (e.year.isNotEmpty)
                      Text(e.year, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                  ]),
                  if (e.institution.isNotEmpty)
                    Text(e.institution,
                        style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ]),
              )),
        ],

        // ── Certifications ────────────────────────────────────────────────
        if (data.certifications.isNotEmpty) ...[
          _sectionHead('Certifications'),
          const SizedBox(height: 6),
          ...data.certifications.map((c) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                    '• ${c.name}${c.organization.isNotEmpty ? ' (${c.organization})' : ''}',
                    style: const TextStyle(fontSize: 12)),
              )),
          const SizedBox(height: 12),
        ],

        // ── Internship ────────────────────────────────────────────────────
        if (data.internships.isNotEmpty) ...[
          _sectionHead('Internships'),
          const SizedBox(height: 6),
          ...data.internships.map((i) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(i.role,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                  if (i.company.isNotEmpty)
                    Text(i.company, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  if (i.description.isNotEmpty)
                    Text(i.description, style: const TextStyle(fontSize: 11)),
                ]),
              )),
        ],
      ],
    );
  }

  Widget _sectionHead(String title) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold, color: _accent)),
          const Divider(height: 6, thickness: 1, color: _accent),
        ],
      );
}


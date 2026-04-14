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
        // ── Header ──────────────────────────────────────────────────────────
        Text(
          data.name.isEmpty ? 'Your Name' : data.name,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        const SizedBox(height: 4),
        Text(
          [
            if (data.email.isNotEmpty) data.email,
            if (data.phone.isNotEmpty) data.phone,
            if (data.location.isNotEmpty) data.location,
          ].join('  •  '),
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        const Divider(height: 28, thickness: 1.5),

        // ── Summary ─────────────────────────────────────────────────────────
        if (data.summary.isNotEmpty) ...[
          _sectionTitle('Summary', Colors.blueAccent),
          const SizedBox(height: 6),
          Text(data.summary, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 18),
        ],

        // ── Skills ──────────────────────────────────────────────────────────
        if (data.skills.isNotEmpty) ...[
          _sectionTitle('Skills', Colors.blueAccent),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: data.skills
                .map((s) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Text(s, style: const TextStyle(fontSize: 11)),
                    ))
                .toList(),
          ),
          const SizedBox(height: 18),
        ],

        // ── Experience ──────────────────────────────────────────────────────
        if (data.experience.isNotEmpty) ...[
          _sectionTitle('Work Experience', Colors.blueAccent),
          const SizedBox(height: 6),
          ...data.experience.map((e) => _experienceItem(e)),
        ],

        // ── Projects ────────────────────────────────────────────────────────
        if (data.projects.isNotEmpty) ...[
          _sectionTitle('Projects', Colors.blueAccent),
          const SizedBox(height: 6),
          ...data.projects.map((p) => _projectItem(p)),
        ],

        // ── Education ───────────────────────────────────────────────────────
        if (data.education.isNotEmpty) ...[
          _sectionTitle('Education', Colors.blueAccent),
          const SizedBox(height: 6),
          ...data.education.map((e) => _educationItem(e)),
        ],

        // ── Certifications ───────────────────────────────────────────────────
        if (data.certifications.isNotEmpty) ...[
          _sectionTitle('Certifications', Colors.blueAccent),
          const SizedBox(height: 6),
          ...data.certifications.map((c) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('• ${c.name}${c.organization.isNotEmpty ? ' — ${c.organization}' : ''}',
                    style: const TextStyle(fontSize: 12)),
              )),
        ],
      ],
    );
  }

  Widget _sectionTitle(String text, Color color) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color)),
      );

  Widget _experienceItem(ExperienceEntry e) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(e.jobTitle, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              if (e.duration.isNotEmpty)
                Text(e.duration, style: const TextStyle(fontSize: 11, color: Colors.black54)),
            ]),
            if (e.company.isNotEmpty)
              Text(e.company, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            if (e.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(e.description, style: const TextStyle(fontSize: 11)),
              ),
          ],
        ),
      );

  Widget _projectItem(ProjectEntry p) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            if (p.technologies.isNotEmpty)
              Text('Tech: ${p.technologies}',
                  style: const TextStyle(fontSize: 11, color: Colors.black54)),
            if (p.description.isNotEmpty)
              Text(p.description, style: const TextStyle(fontSize: 11)),
            if (p.link.isNotEmpty)
              Text(p.link, style: const TextStyle(fontSize: 11, color: Colors.blue)),
          ],
        ),
      );

  Widget _educationItem(EducationEntry e) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(e.degree, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              if (e.year.isNotEmpty)
                Text(e.year, style: const TextStyle(fontSize: 11, color: Colors.black54)),
            ]),
            if (e.institution.isNotEmpty)
              Text(e.institution, style: const TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      );
}


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
        // ── Header ──────────────────────────────────────────────────────
        Text(
          data.name.isEmpty ? 'YOUR NAME' : data.name.toUpperCase(),
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          [
            if (data.email.isNotEmpty) data.email,
            if (data.phone.isNotEmpty) data.phone,
            if (data.location.isNotEmpty) data.location,
          ].join('  |  '),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11),
        ),
        const SizedBox(height: 18),

        // ── Summary ─────────────────────────────────────────────────────
        if (data.summary.isNotEmpty) ...[
          _sectionHead('SUMMARY'),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(data.summary, style: const TextStyle(fontSize: 12)),
          ),
          const SizedBox(height: 16),
        ],

        // ── Skills ──────────────────────────────────────────────────────
        if (data.skills.isNotEmpty) ...[
          _sectionHead('SKILLS'),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(data.skills.join('  •  '), style: const TextStyle(fontSize: 12)),
          ),
          const SizedBox(height: 16),
        ],

        // ── Experience ──────────────────────────────────────────────────
        if (data.experience.isNotEmpty) ...[
          _sectionHead('EXPERIENCE'),
          ...data.experience.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(e.jobTitle,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    if (e.duration.isNotEmpty)
                      Text(e.duration, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                  ]),
                  if (e.company.isNotEmpty)
                    Text(e.company, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  if (e.description.isNotEmpty)
                    Text(e.description, style: const TextStyle(fontSize: 11)),
                ]),
              )),
        ],

        // ── Education ───────────────────────────────────────────────────
        if (data.education.isNotEmpty) ...[
          _sectionHead('EDUCATION'),
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
                    Text(e.institution, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ]),
              )),
        ],

        // ── Projects (optional) ──────────────────────────────────────────
        if (data.projects.isNotEmpty) ...[
          _sectionHead('PROJECTS'),
          ...data.projects.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(p.name,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                  if (p.description.isNotEmpty)
                    Text(p.description, style: const TextStyle(fontSize: 11)),
                ]),
              )),
        ],
      ],
    );
  }

  Widget _sectionHead(String title) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1)),
          ),
          const Divider(color: Colors.black, thickness: 1, height: 10),
          const SizedBox(height: 4),
        ],
      );
}


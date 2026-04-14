import 'package:flutter/material.dart';
import '../../models/resume_model.dart';
import '../../providers/resume_provider.dart';
import 'section_header.dart';

class EducationSection extends StatelessWidget {
  final ResumeProvider provider;

  const EducationSection({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final entries = provider.resumeData.education;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Education',
          subtitle: 'Add your academic qualifications',
        ),
        const SizedBox(height: 12),
        ...List.generate(entries.length, (i) {
          final entry = entries[i];
          return _EducationCard(
            index: i,
            entry: entry,
            onRemove: () => provider.removeEducation(i),
            onChanged: (updated) => provider.updateEducation(i, updated),
          );
        }),
        AddItemButton(
          label: '+ Add Education',
          onPressed: provider.addEducation,
        ),
      ],
    );
  }
}

class _EducationCard extends StatelessWidget {
  final int index;
  final EducationEntry entry;
  final VoidCallback onRemove;
  final ValueChanged<EducationEntry> onChanged;

  const _EducationCard({
    required this.index,
    required this.entry,
    required this.onRemove,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final title = entry.degree.isEmpty ? 'Education #${index + 1}' : entry.degree;
    return EntryCard(
      title: title,
      onRemove: onRemove,
      children: [
        _field('Degree / Qualification', entry.degree,
            (v) => onChanged(entry.copyWith(degree: v)),
            hint: 'e.g. B.Tech Computer Science'),
        const SizedBox(height: 12),
        _field('Institution', entry.institution,
            (v) => onChanged(entry.copyWith(institution: v)),
            hint: 'e.g. Anna University'),
        const SizedBox(height: 12),
        _field('Year of Graduation', entry.year,
            (v) => onChanged(entry.copyWith(year: v)),
            hint: 'e.g. 2024 or 2020 – 2024'),
      ],
    );
  }

  Widget _field(String label, String value, ValueChanged<String> onChanged,
      {String? hint}) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      onChanged: onChanged,
    );
  }
}

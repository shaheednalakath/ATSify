import 'package:flutter/material.dart';
import '../../models/resume_model.dart';
import '../../providers/resume_provider.dart';
import 'section_header.dart';

class ExperienceSection extends StatelessWidget {
  final ResumeProvider provider;
  final bool optional;

  const ExperienceSection({
    super.key,
    required this.provider,
    this.optional = false,
  });

  @override
  Widget build(BuildContext context) {
    final entries = provider.resumeData.experience;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: optional ? 'Work Experience (Optional)' : 'Work Experience',
          subtitle: 'List your most recent roles first',
        ),
        const SizedBox(height: 12),
        ...List.generate(entries.length, (i) {
          final entry = entries[i];
          return _ExperienceCard(
            index: i,
            entry: entry,
            onRemove: () => provider.removeExperience(i),
            onChanged: (updated) => provider.updateExperience(i, updated),
          );
        }),
        AddItemButton(
          label: '+ Add Experience',
          onPressed: provider.addExperience,
        ),
      ],
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final int index;
  final ExperienceEntry entry;
  final VoidCallback onRemove;
  final ValueChanged<ExperienceEntry> onChanged;

  const _ExperienceCard({
    required this.index,
    required this.entry,
    required this.onRemove,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final title = entry.jobTitle.isEmpty ? 'Experience #${index + 1}' : entry.jobTitle;
    return EntryCard(
      title: title,
      onRemove: onRemove,
      children: [
        _field('Job Title', entry.jobTitle, (v) => onChanged(entry.copyWith(jobTitle: v))),
        const SizedBox(height: 12),
        _field('Company Name', entry.company, (v) => onChanged(entry.copyWith(company: v))),
        const SizedBox(height: 12),
        _field('Duration', entry.duration, (v) => onChanged(entry.copyWith(duration: v)),
            hint: 'e.g. Jan 2022 – Present'),
        const SizedBox(height: 12),
        _field(
          'Description',
          entry.description,
          (v) => onChanged(entry.copyWith(description: v)),
          maxLines: 3,
          hint: '• Achieved X by doing Y...',
        ),
      ],
    );
  }

  Widget _field(String label, String value, ValueChanged<String> onChanged,
      {String? hint, int maxLines = 1}) {
    return TextFormField(
      initialValue: value,
      maxLines: maxLines,
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

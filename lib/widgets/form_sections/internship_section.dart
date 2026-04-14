import 'package:flutter/material.dart';
import '../../models/resume_model.dart';
import '../../providers/resume_provider.dart';
import 'section_header.dart';

class InternshipSection extends StatelessWidget {
  final ResumeProvider provider;

  const InternshipSection({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final entries = provider.resumeData.internships;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Internship (Optional)',
          subtitle: 'Include even short-term or virtual internships',
        ),
        const SizedBox(height: 12),
        ...List.generate(entries.length, (i) {
          final entry = entries[i];
          return _InternshipCard(
            index: i,
            entry: entry,
            onRemove: () => provider.removeInternship(i),
            onChanged: (updated) => provider.updateInternship(i, updated),
          );
        }),
        AddItemButton(
          label: '+ Add Internship',
          onPressed: provider.addInternship,
        ),
      ],
    );
  }
}

class _InternshipCard extends StatelessWidget {
  final int index;
  final InternshipEntry entry;
  final VoidCallback onRemove;
  final ValueChanged<InternshipEntry> onChanged;

  const _InternshipCard({
    required this.index,
    required this.entry,
    required this.onRemove,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final title = entry.role.isEmpty ? 'Internship #${index + 1}' : entry.role;
    return EntryCard(
      title: title,
      onRemove: onRemove,
      children: [
        TextFormField(
          initialValue: entry.role,
          decoration: const InputDecoration(
            labelText: 'Role / Position',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          onChanged: (v) => onChanged(entry.copyWith(role: v)),
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: entry.company,
          decoration: const InputDecoration(
            labelText: 'Company / Organization',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          onChanged: (v) => onChanged(entry.copyWith(company: v)),
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: entry.description,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Description',
            hintText: 'What did you work on? What did you learn?',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            alignLabelWithHint: true,
          ),
          onChanged: (v) => onChanged(entry.copyWith(description: v)),
        ),
      ],
    );
  }
}

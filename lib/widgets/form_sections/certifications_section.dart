import 'package:flutter/material.dart';
import '../../models/resume_model.dart';
import '../../providers/resume_provider.dart';
import 'section_header.dart';

class CertificationsSection extends StatelessWidget {
  final ResumeProvider provider;
  /// When true, label "Organization" becomes "Platform (Coursera, Udemy...)"
  final bool isCourseMode;

  const CertificationsSection({
    super.key,
    required this.provider,
    this.isCourseMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final entries = provider.resumeData.certifications;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Certifications',
          subtitle: isCourseMode ? 'Online courses and credentials' : 'Professional certifications',
        ),
        const SizedBox(height: 12),
        ...List.generate(entries.length, (i) {
          final entry = entries[i];
          return _CertCard(
            index: i,
            entry: entry,
            isCourseMode: isCourseMode,
            onRemove: () => provider.removeCertification(i),
            onChanged: (updated) => provider.updateCertification(i, updated),
          );
        }),
        AddItemButton(
          label: '+ Add Certification',
          onPressed: provider.addCertification,
        ),
      ],
    );
  }
}

class _CertCard extends StatelessWidget {
  final int index;
  final CertificationEntry entry;
  final bool isCourseMode;
  final VoidCallback onRemove;
  final ValueChanged<CertificationEntry> onChanged;

  const _CertCard({
    required this.index,
    required this.entry,
    required this.isCourseMode,
    required this.onRemove,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final title = entry.name.isEmpty ? 'Certification #${index + 1}' : entry.name;
    return EntryCard(
      title: title,
      onRemove: onRemove,
      children: [
        TextFormField(
          initialValue: entry.name,
          decoration: InputDecoration(
            labelText: isCourseMode ? 'Course Name' : 'Certification Name',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          onChanged: (v) => onChanged(entry.copyWith(name: v)),
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: entry.organization,
          decoration: InputDecoration(
            labelText: isCourseMode ? 'Platform (Coursera, Udemy...)' : 'Issuing Organization',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          onChanged: (v) => onChanged(entry.copyWith(organization: v)),
        ),
      ],
    );
  }
}

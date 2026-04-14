import 'package:flutter/material.dart';
import '../../models/resume_model.dart';
import '../../providers/resume_provider.dart';
import 'section_header.dart';

class ProjectsSection extends StatelessWidget {
  final ResumeProvider provider;
  final bool showLinkField;
  final bool showTechField;
  final bool optional;

  const ProjectsSection({
    super.key,
    required this.provider,
    this.showLinkField = true,
    this.showTechField = true,
    this.optional = false,
  });

  @override
  Widget build(BuildContext context) {
    final entries = provider.resumeData.projects;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: optional ? 'Projects (Optional)' : 'Projects',
          subtitle: 'Showcase your best work',
        ),
        const SizedBox(height: 12),
        ...List.generate(entries.length, (i) {
          final entry = entries[i];
          return _ProjectCard(
            index: i,
            entry: entry,
            showLinkField: showLinkField,
            showTechField: showTechField,
            onRemove: () => provider.removeProject(i),
            onChanged: (updated) => provider.updateProject(i, updated),
          );
        }),
        AddItemButton(
          label: '+ Add Project',
          onPressed: provider.addProject,
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final int index;
  final ProjectEntry entry;
  final bool showLinkField;
  final bool showTechField;
  final VoidCallback onRemove;
  final ValueChanged<ProjectEntry> onChanged;

  const _ProjectCard({
    required this.index,
    required this.entry,
    required this.showLinkField,
    required this.showTechField,
    required this.onRemove,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final title = entry.name.isEmpty ? 'Project #${index + 1}' : entry.name;
    return EntryCard(
      title: title,
      onRemove: onRemove,
      children: [
        _field('Project Name', entry.name, (v) => onChanged(entry.copyWith(name: v))),
        const SizedBox(height: 12),
        _field(
          'Description',
          entry.description,
          (v) => onChanged(entry.copyWith(description: v)),
          maxLines: 3,
          hint: 'What did this project do? What problem did it solve?',
        ),
        if (showTechField) ...[
          const SizedBox(height: 12),
          _field(
            'Technologies Used',
            entry.technologies,
            (v) => onChanged(entry.copyWith(technologies: v)),
            hint: 'e.g. Flutter, Node.js, PostgreSQL',
          ),
        ],
        if (showLinkField) ...[
          const SizedBox(height: 12),
          _field(
            'GitHub / Live Link (Optional)',
            entry.link,
            (v) => onChanged(entry.copyWith(link: v)),
            hint: 'https://github.com/...',
          ),
        ],
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

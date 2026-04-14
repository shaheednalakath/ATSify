import 'package:flutter/material.dart';
import '../../providers/resume_provider.dart';
import 'section_header.dart';

class SkillsSection extends StatefulWidget {
  final ResumeProvider provider;

  const SkillsSection({super.key, required this.provider});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _add() {
    final val = _controller.text.trim();
    if (val.isEmpty) return;
    final updated = [...widget.provider.resumeData.skills, val];
    widget.provider.updateSkills(updated);
    _controller.clear();
  }

  void _remove(String skill) {
    final updated = widget.provider.resumeData.skills.where((s) => s != skill).toList();
    widget.provider.updateSkills(updated);
  }

  @override
  Widget build(BuildContext context) {
    final skills = widget.provider.resumeData.skills;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Skills *',
          subtitle: 'Add at least one relevant skill',
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'e.g. Flutter, Python, SQL...',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => _add(),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: _add,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add'),
            ),
          ],
        ),
        if (skills.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'No skills added yet',
              style: TextStyle(color: Colors.grey[500], fontSize: 13),
            ),
          ),
        if (skills.isNotEmpty) ...[
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: skills
                .map((skill) => Chip(
                      label: Text(skill),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () => _remove(skill),
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                    ))
                .toList(),
          ),
        ],
      ],
    );
  }
}

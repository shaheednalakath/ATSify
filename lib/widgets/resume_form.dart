import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/resume_provider.dart';

class ResumeForm extends StatefulWidget {
  const ResumeForm({super.key});

  @override
  State<ResumeForm> createState() => _ResumeFormState();
}

class _ResumeFormState extends State<ResumeForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _skillController = TextEditingController();

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }

  void _addSkill(ResumeProvider provider) {
    final newSkill = _skillController.text.trim();
    if (newSkill.isNotEmpty) {
      final currentSkills = List<String>.from(provider.resumeData.skills);
      currentSkills.add(newSkill);
      provider.updateSkills(currentSkills);
      _skillController.clear();
    }
  }

  void _removeSkill(ResumeProvider provider, String skill) {
    final currentSkills = List<String>.from(provider.resumeData.skills);
    currentSkills.remove(skill);
    provider.updateSkills(currentSkills);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResumeProvider>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: provider.resumeData.name,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name cannot be empty';
                }
                return null;
              },
              onChanged: (value) => provider.updateName(value),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: provider.resumeData.email,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email cannot be empty';
                }
                return null;
              },
              onChanged: (value) => provider.updateEmail(value),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: provider.resumeData.phone,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => provider.updatePhone(value),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: provider.resumeData.summary,
              decoration: const InputDecoration(
                labelText: 'Summary',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              onChanged: (value) => provider.updateSummary(value),
            ),
            const SizedBox(height: 32),
            const Text(
              'Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _skillController,
                    decoration: const InputDecoration(
                      labelText: 'Add a skill',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addSkill(provider),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addSkill(provider),
                  child: const Text('Add Skill'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: provider.resumeData.skills.map((skill) {
                return Chip(
                  label: Text(skill),
                  onDeleted: () => _removeSkill(provider, skill),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

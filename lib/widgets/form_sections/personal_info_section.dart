import 'package:flutter/material.dart';
import '../../providers/resume_provider.dart';
import 'section_header.dart';

class PersonalInfoSection extends StatelessWidget {
  final ResumeProvider provider;

  const PersonalInfoSection({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final data = provider.resumeData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Personal Information'),
        const SizedBox(height: 16),
        _buildField(
          label: 'Full Name *',
          initialValue: data.name,
          onChanged: provider.updateName,
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Name is required' : null,
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'Email *',
          initialValue: data.email,
          onChanged: provider.updateEmail,
          keyboardType: TextInputType.emailAddress,
          validator: (v) {
            if (v == null || v.trim().isEmpty) return 'Email is required';
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v.trim())) {
              return 'Enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _buildField(
                label: 'Phone *',
                initialValue: data.phone,
                onChanged: provider.updatePhone,
                keyboardType: TextInputType.phone,
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Phone is required' : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildField(
                label: 'Location',
                initialValue: data.location,
                onChanged: provider.updateLocation,
                hint: 'City, State',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const SectionHeader(title: 'Professional Summary'),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: data.summary,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Summary / Objective *',
            hintText: 'Write 2–3 sentences about your professional goals and strengths...',
            border: OutlineInputBorder(),
            alignLabelWithHint: true,
          ),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Summary is required' : null,
          onChanged: provider.updateSummary,
        ),
      ],
    );
  }

  Widget _buildField({
    required String label,
    required String initialValue,
    required Function(String) onChanged,
    String? hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/resume_provider.dart';
import 'form_sections/personal_info_section.dart';
import 'form_sections/skills_section.dart';
import 'form_sections/experience_section.dart';
import 'form_sections/projects_section.dart';
import 'form_sections/education_section.dart';
import 'form_sections/certifications_section.dart';
import 'form_sections/internship_section.dart';

class ResumeForm extends StatefulWidget {
  const ResumeForm({super.key});

  @override
  State<ResumeForm> createState() => _ResumeFormState();
}

class _ResumeFormState extends State<ResumeForm> {
  final _formKey = GlobalKey<FormState>();

  void _validate(ResumeProvider provider) {
    final isValid = _formKey.currentState?.validate() ?? false;
    final template = provider.selectedTemplate.toLowerCase();

    if (isValid) {
      // Fresher: require at least 1 project
      if (template == 'fresher' && provider.resumeData.projects.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('⚠️  Fresher template requires at least 1 project.'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Resume looks good! Use the download buttons to export.'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('⚠️  Please fill in all required fields.'),
          backgroundColor: Colors.deepOrange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResumeProvider>(context);
    final template = provider.selectedTemplate.toLowerCase();

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          // Template indicator banner
          _TemplateBanner(template: template),

          // Scrollable form body
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── Common sections (all templates) ────────────────────────
                  PersonalInfoSection(provider: provider),
                  const SizedBox(height: 28),
                  SkillsSection(provider: provider),
                  const SizedBox(height: 28),

                  // ─── Template-specific sections ──────────────────────────────
                  ..._buildTemplateSections(context, provider, template),
                ],
              ),
            ),
          ),

          // Validate button pinned at bottom
          _ValidationBar(onValidate: () => _validate(provider)),
        ],
      ),
    );
  }

  List<Widget> _buildTemplateSections(
      BuildContext context, ResumeProvider provider, String template) {
    switch (template) {
      // ── MODERN ────────────────────────────────────────────────────────────
      case 'modern':
      case 'experience':
        return [
          ExperienceSection(provider: provider),
          const SizedBox(height: 28),
          ProjectsSection(provider: provider, showLinkField: true, showTechField: true),
          const SizedBox(height: 28),
          EducationSection(provider: provider),
          const SizedBox(height: 28),
          CertificationsSection(provider: provider, isCourseMode: false),
        ];

      // ── FRESHER ───────────────────────────────────────────────────────────
      case 'fresher':
        return [
          ProjectsSection(provider: provider, showLinkField: true, showTechField: true),
          const SizedBox(height: 28),
          EducationSection(provider: provider),
          const SizedBox(height: 28),
          CertificationsSection(provider: provider, isCourseMode: true),
          const SizedBox(height: 28),
          InternshipSection(provider: provider),
        ];

      // ── CLASSIC / BASIC / ALL OTHERS ─────────────────────────────────────
      default:
        return [
          ExperienceSection(provider: provider, optional: true),
          const SizedBox(height: 28),
          EducationSection(provider: provider),
          const SizedBox(height: 28),
          ProjectsSection(
              provider: provider, optional: true, showLinkField: false, showTechField: false),
        ];
    }
  }
}

// ─── Supporting Widgets ───────────────────────────────────────────────────────

class _TemplateBanner extends StatelessWidget {
  final String template;

  const _TemplateBanner({required this.template});

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, dynamic>> info = {
      'modern': {'label': 'Modern Template', 'color': Colors.blue, 'icon': Icons.rocket_launch},
      'experience': {
        'label': 'Experience Template',
        'color': Colors.indigo,
        'icon': Icons.work_history
      },
      'fresher': {
        'label': 'Fresher Template',
        'color': Colors.teal,
        'icon': Icons.school_outlined
      },
      'classic': {'label': 'Classic Template', 'color': Colors.brown, 'icon': Icons.article},
      'skills': {
        'label': 'Skills Template',
        'color': Colors.purple,
        'icon': Icons.psychology_outlined
      },
      'compact': {'label': 'Compact Template', 'color': Colors.grey, 'icon': Icons.compress},
    };

    final data = info[template] ?? {'label': '${template[0].toUpperCase()}${template.substring(1)} Template', 'color': Colors.blueGrey, 'icon': Icons.description};
    final color = data['color'] as Color;
    final icon = data['icon'] as IconData;
    final label = data['label'] as String;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: color.withValues(alpha: 0.1),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const Spacer(),
          Text(
            'Filling form for this template',
            style: TextStyle(color: color.withValues(alpha: 0.7), fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class _ValidationBar extends StatelessWidget {
  final VoidCallback onValidate;

  const _ValidationBar({required this.onValidate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onValidate,
          icon: const Icon(Icons.check_circle_outline),
          label: const Text('Validate Resume'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }
}



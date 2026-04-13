import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/resume_provider.dart';
import 'template_selector.dart';

class ResumePreview extends StatelessWidget {
  const ResumePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Consumer<ResumeProvider>(
          builder: (context, provider, child) {
            return getTemplate(provider.selectedTemplate, provider.resumeData);
          },
        ),
      ),
    );
  }
}

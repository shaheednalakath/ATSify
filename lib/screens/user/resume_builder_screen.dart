import 'package:flutter/material.dart';
import '../../widgets/resume_form.dart';
import '../../widgets/resume_preview.dart';

class ResumeBuilderScreen extends StatelessWidget {
  const ResumeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: ResumeForm(),
          ),
          const VerticalDivider(width: 1, thickness: 1),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200],
              child: const ResumePreview(),
            ),
          ),
        ],
      ),
    );
  }
}

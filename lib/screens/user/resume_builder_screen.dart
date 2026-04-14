import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/resume_provider.dart';
import '../../services/pdf_service.dart';
import '../../services/docx_service.dart';
import '../../services/firestore_service.dart';
import '../../widgets/resume_form.dart';
import '../../widgets/resume_preview.dart';

class ResumeBuilderScreen extends StatelessWidget {
  const ResumeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder'),
        actions: [
          // Save to Firebase
          IconButton(
            icon: const Icon(Icons.cloud_upload),
            tooltip: 'Save to Cloud',
            onPressed: () async {
              try {
                await FirestoreService.saveUserResume(resumeProvider.resumeData);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Resume saved to cloud!')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Save failed: $e')),
                  );
                }
              }
            },
          ),
          // Download PDF
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            tooltip: 'Download PDF',
            onPressed: () async {
              try {
                await PdfService.generateAndDownloadPDF(resumeProvider.resumeData);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('✅ PDF download started!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('❌ Failed to download PDF: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
          ),
          // Download DOCX
          IconButton(
            icon: const Icon(Icons.description),
            tooltip: 'Download Word',
            onPressed: () async {
              try {
                await DocxService.generateAndDownloadDocx(resumeProvider.resumeData);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('✅ Word document download started!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('❌ Failed to download DOCX: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
          ),
        ],
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

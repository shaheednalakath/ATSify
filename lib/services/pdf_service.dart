import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import '../models/resume_model.dart';

class PdfService {
  static Future<String> generatePDF(ResumeModel data) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header
              pw.Text(
                data.name.isEmpty ? 'Your Name' : data.name,
                style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 8),
              pw.Text('${data.email} | ${data.phone}'),
              pw.Divider(thickness: 2),
              pw.SizedBox(height: 16),
              
              // Summary
              pw.Text(
                'Summary',
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 8),
              pw.Text(data.summary.isEmpty ? 'Your summary... ' : data.summary),
              pw.SizedBox(height: 24),
              
              // Skills
              pw.Text(
                'Skills',
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 8),
              pw.Text(data.skills.join(', ')),
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/resume.pdf');
    await file.writeAsBytes(await pdf.save());
    
    return file.path;
  }
}

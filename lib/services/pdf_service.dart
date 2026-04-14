// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../models/resume_model.dart';

class PdfService {
  static Future<void> generateAndDownloadPDF(ResumeModel data) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (pw.Context context) {
          return [
            // ─── HEADER ──────────────────────────────────────────────────────
            pw.Text(
              data.name.isEmpty ? 'Your Name' : data.name,
              style: pw.TextStyle(fontSize: 26, fontWeight: pw.FontWeight.bold, color: PdfColors.blueAccent700),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              [
                if (data.email.isNotEmpty) data.email,
                if (data.phone.isNotEmpty) data.phone,
                if (data.location.isNotEmpty) data.location,
              ].join('  |  '),
              style: const pw.TextStyle(fontSize: 11, color: PdfColors.grey700),
            ),
            pw.SizedBox(height: 8),
            pw.Divider(thickness: 1.5, color: PdfColors.blueAccent700),
            pw.SizedBox(height: 16),

            // ─── SUMMARY ─────────────────────────────────────────────────────
            if (data.summary.isNotEmpty) ...[
              _sectionTitle('Professional Summary'),
              pw.Text(data.summary, style: const pw.TextStyle(fontSize: 10)),
              pw.SizedBox(height: 16),
            ],

            // ─── SKILLS ──────────────────────────────────────────────────────
            if (data.skills.isNotEmpty) ...[
              _sectionTitle('Skills'),
              pw.Wrap(
                spacing: 6,
                runSpacing: 4,
                children: data.skills
                    .map((skill) => pw.Container(
                          padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: pw.BoxDecoration(
                            color: PdfColors.blueGrey50,
                            borderRadius: pw.BorderRadius.circular(3),
                            border: pw.Border.all(color: PdfColors.blueGrey100),
                          ),
                          child: pw.Text(skill, style: const pw.TextStyle(fontSize: 9)),
                        ))
                    .toList(),
              ),
              pw.SizedBox(height: 16),
            ],

            // ─── EXPERIENCE ──────────────────────────────────────────────────
            if (data.experience.isNotEmpty) ...[
              _sectionTitle('Work Experience'),
              ...data.experience.map((e) => pw.Padding(
                    padding: const pw.EdgeInsets.only(bottom: 12),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(e.jobTitle,
                                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
                            pw.Text(e.duration,
                                style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700)),
                          ],
                        ),
                        pw.Text(e.company,
                            style: pw.TextStyle(
                                fontSize: 10,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.grey800)),
                        if (e.description.isNotEmpty)
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(top: 4),
                            child: pw.Text(e.description, style: const pw.TextStyle(fontSize: 10)),
                          ),
                      ],
                    ),
                  )),
              pw.SizedBox(height: 12),
            ],

            // ─── PROJECTS ────────────────────────────────────────────────────
            if (data.projects.isNotEmpty) ...[
              _sectionTitle('Projects'),
              ...data.projects.map((p) => pw.Padding(
                    padding: const pw.EdgeInsets.only(bottom: 10),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(p.name,
                                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
                            if (p.link.isNotEmpty)
                              pw.Text(p.link,
                                  style: const pw.TextStyle(fontSize: 9, color: PdfColors.blue)),
                          ],
                        ),
                        if (p.technologies.isNotEmpty)
                          pw.Text('Technologies: ${p.technologies}',
                              style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700)),
                        pw.Text(p.description, style: const pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  )),
              pw.SizedBox(height: 12),
            ],

            // ─── EDUCATION ───────────────────────────────────────────────────
            if (data.education.isNotEmpty) ...[
              _sectionTitle('Education'),
              ...data.education.map((e) => pw.Padding(
                    padding: const pw.EdgeInsets.only(bottom: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(e.degree,
                                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
                            pw.Text(e.year,
                                style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700)),
                          ],
                        ),
                        pw.Text(e.institution, style: const pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  )),
              pw.SizedBox(height: 12),
            ],

            // ─── CERTIFICATIONS ──────────────────────────────────────────────
            if (data.certifications.isNotEmpty) ...[
              _sectionTitle('Certifications'),
              ...data.certifications.map((c) => pw.Padding(
                    padding: const pw.EdgeInsets.only(bottom: 4),
                    child: pw.Text(
                      '• ${c.name}${c.organization.isNotEmpty ? ' — ${c.organization}' : ''}',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  )),
              pw.SizedBox(height: 12),
            ],

            // ─── INTERNSHIPS ─────────────────────────────────────────────────
            if (data.internships.isNotEmpty) ...[
              _sectionTitle('Internships'),
              ...data.internships.map((i) => pw.Padding(
                    padding: const pw.EdgeInsets.only(bottom: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(i.role,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
                        pw.Text(i.company,
                            style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey800)),
                        pw.Text(i.description, style: const pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  )),
            ],
          ];
        },
      ),
    );

    final bytes = await pdf.save();

    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute('download', 'resume.pdf')
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  static pw.Widget _sectionTitle(String title) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title.toUpperCase(),
          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColors.blueAccent700),
        ),
        pw.SizedBox(height: 4),
        pw.Divider(thickness: 1, color: PdfColors.blueGrey100),
        pw.SizedBox(height: 6),
      ],
    );
  }
}


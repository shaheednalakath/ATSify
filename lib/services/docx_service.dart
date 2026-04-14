// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:docx_template/docx_template.dart';
import '../models/resume_model.dart';

class DocxService {
  static Future<void> generateAndDownloadDocx(ResumeModel data) async {
    // Read the template from assets
    final dataBytes = await rootBundle.load('assets/template.docx');
    final bytes = dataBytes.buffer.asUint8List(dataBytes.offsetInBytes, dataBytes.lengthInBytes);

    final docx = await DocxTemplate.fromBytes(bytes);

    Content c = Content();
    c.add(TextContent('name', data.name.isEmpty ? 'Your Name' : data.name));
    c.add(TextContent('email', data.email.isEmpty ? 'email@example.com' : data.email));
    c.add(TextContent('phone', data.phone.isEmpty ? 'Phone Number' : data.phone));
    c.add(TextContent('location', data.location.isEmpty ? 'City, State' : data.location));
    c.add(TextContent('summary', data.summary.isEmpty ? 'Professional summary...' : data.summary));
    c.add(TextContent('skills', data.skills.isEmpty ? 'Add your skills' : data.skills.join(' • ')));

    // Formatting complex lists into strings for simple template replacement
    c.add(TextContent('experience', data.experience.isEmpty 
      ? 'No experience listed' 
      : data.experience.map((e) => '${e.jobTitle} at ${e.company} (${e.duration})\n${e.description}').join('\n\n')));

    c.add(TextContent('projects', data.projects.isEmpty 
      ? 'No projects listed' 
      : data.projects.map((p) => '${p.name} (${p.technologies})\n${p.description}${p.link.isNotEmpty ? '\nLink: ${p.link}' : ''}').join('\n\n')));

    c.add(TextContent('education', data.education.isEmpty 
      ? 'No education listed' 
      : data.education.map((e) => '${e.degree} from ${e.institution} (${e.year})').join('\n')));

    c.add(TextContent('certifications', data.certifications.isEmpty 
      ? 'No certifications' 
      : data.certifications.map((c) => '• ${c.name}${c.organization.isNotEmpty ? ' — ${c.organization}' : ''}').join('\n')));

    c.add(TextContent('internships', data.internships.isEmpty 
      ? '' 
      : data.internships.map((i) => '${i.role} at ${i.company}\n${i.description}').join('\n\n')));

    final generatedBytes = await docx.generate(c);

    if (generatedBytes == null) {
      throw Exception('Failed to generate DOCX: template produced no output.');
    }

    // Use dart:html to trigger a browser file download
    final blob = html.Blob(
      [generatedBytes],
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    );
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute('download', 'resume.docx')
      ..click();
    html.Url.revokeObjectUrl(url);
  }
}


import 'dart:io';
import 'package:flutter/services.dart';
import 'package:docx_template/docx_template.dart';
import 'package:path_provider/path_provider.dart';
import '../models/resume_model.dart';

class DocxService {
  static Future<String> generateDocx(ResumeModel data) async {
    // Read the template from assets
    final dataBytes = await rootBundle.load('assets/template.docx');
    final bytes = dataBytes.buffer.asUint8List(dataBytes.offsetInBytes, dataBytes.lengthInBytes);
    
    final docx = await DocxTemplate.fromBytes(bytes);

    Content c = Content();
    c.add(TextContent('name', data.name.isEmpty ? 'Your Name' : data.name));
    c.add(TextContent('email', data.email.isEmpty ? '...' : data.email));
    c.add(TextContent('phone', data.phone.isEmpty ? '...' : data.phone));
    c.add(TextContent('summary', data.summary.isEmpty ? 'Summary...' : data.summary));
    c.add(TextContent('skills', data.skills.join(', ')));

    final generatedBytes = await docx.generate(c);
    
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/resume.docx');
    
    if (generatedBytes != null) {
      await file.writeAsBytes(generatedBytes);
    }
    
    return file.path;
  }
}

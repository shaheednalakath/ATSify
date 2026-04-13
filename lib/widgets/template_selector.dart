import 'package:flutter/material.dart';
import '../models/resume_model.dart';
import '../templates/modern_template.dart';
import '../templates/classic_template.dart';
import '../templates/fresher_template.dart';

Widget getTemplate(String template, ResumeModel data) {
  switch (template.toLowerCase()) {
    case 'classic':
      return ClassicTemplate(data: data);
    case 'fresher':
      return FresherTemplate(data: data);
    case 'modern':
    default:
      return ModernTemplate(data: data);
  }
}

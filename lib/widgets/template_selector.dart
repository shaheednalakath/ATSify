import 'package:flutter/material.dart';
import '../models/resume_model.dart';
import '../templates/modern_template.dart';
import '../templates/classic_template.dart';
import '../templates/fresher_template.dart';
import '../templates/experience_template.dart';
import '../templates/skills_template.dart';
import '../templates/compact_template.dart';

Widget getTemplate(String template, ResumeModel data) {
  switch (template.toLowerCase()) {
    case 'classic':
    case 'basic':
      return ClassicTemplate(data: data);
    case 'fresher':
      return FresherTemplate(data: data);
    case 'experience':
      return ExperienceTemplate(data: data);
    case 'skills':
      return SkillsTemplate(data: data);
    case 'compact':
      return CompactTemplate(data: data);
    case 'modern':
    default:
      return ModernTemplate(data: data);
  }
}

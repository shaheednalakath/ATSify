import 'package:flutter/foundation.dart';
import '../models/resume_model.dart';

class ResumeProvider extends ChangeNotifier {
  ResumeModel resumeData = ResumeModel();
  String selectedTemplate = 'default';

  void updateName(String value) {
    resumeData.name = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    resumeData.email = value;
    notifyListeners();
  }

  void updatePhone(String value) {
    resumeData.phone = value;
    notifyListeners();
  }

  void updateSummary(String value) {
    resumeData.summary = value;
    notifyListeners();
  }

  void updateSkills(List<String> skills) {
    resumeData.skills = skills;
    notifyListeners();
  }

  void changeTemplate(String template) {
    selectedTemplate = template;
    notifyListeners();
  }
}

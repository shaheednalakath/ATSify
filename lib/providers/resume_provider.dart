import 'package:flutter/foundation.dart';
import '../models/resume_model.dart';

class ResumeProvider extends ChangeNotifier {
  ResumeModel resumeData = ResumeModel();
  String selectedTemplate = 'modern';

  // ─── Common Fields ──────────────────────────────────────────────────────────

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

  void updateLocation(String value) {
    resumeData.location = value;
    notifyListeners();
  }

  void updateSummary(String value) {
    resumeData.summary = value;
    notifyListeners();
  }

  void updateSkills(List<String> skills) {
    resumeData.skills = List<String>.from(skills);
    notifyListeners();
  }

  void changeTemplate(String template) {
    selectedTemplate = template;
    notifyListeners();
  }

  // ─── Experience ─────────────────────────────────────────────────────────────

  void addExperience() {
    resumeData.experience = [...resumeData.experience, ExperienceEntry()];
    notifyListeners();
  }

  void updateExperience(int index, ExperienceEntry entry) {
    final list = List<ExperienceEntry>.from(resumeData.experience);
    list[index] = entry;
    resumeData.experience = list;
    notifyListeners();
  }

  void removeExperience(int index) {
    final list = List<ExperienceEntry>.from(resumeData.experience);
    list.removeAt(index);
    resumeData.experience = list;
    notifyListeners();
  }

  // ─── Projects ───────────────────────────────────────────────────────────────

  void addProject() {
    resumeData.projects = [...resumeData.projects, ProjectEntry()];
    notifyListeners();
  }

  void updateProject(int index, ProjectEntry entry) {
    final list = List<ProjectEntry>.from(resumeData.projects);
    list[index] = entry;
    resumeData.projects = list;
    notifyListeners();
  }

  void removeProject(int index) {
    final list = List<ProjectEntry>.from(resumeData.projects);
    list.removeAt(index);
    resumeData.projects = list;
    notifyListeners();
  }

  // ─── Education ──────────────────────────────────────────────────────────────

  void addEducation() {
    resumeData.education = [...resumeData.education, EducationEntry()];
    notifyListeners();
  }

  void updateEducation(int index, EducationEntry entry) {
    final list = List<EducationEntry>.from(resumeData.education);
    list[index] = entry;
    resumeData.education = list;
    notifyListeners();
  }

  void removeEducation(int index) {
    final list = List<EducationEntry>.from(resumeData.education);
    list.removeAt(index);
    resumeData.education = list;
    notifyListeners();
  }

  // ─── Certifications ─────────────────────────────────────────────────────────

  void addCertification() {
    resumeData.certifications = [...resumeData.certifications, CertificationEntry()];
    notifyListeners();
  }

  void updateCertification(int index, CertificationEntry entry) {
    final list = List<CertificationEntry>.from(resumeData.certifications);
    list[index] = entry;
    resumeData.certifications = list;
    notifyListeners();
  }

  void removeCertification(int index) {
    final list = List<CertificationEntry>.from(resumeData.certifications);
    list.removeAt(index);
    resumeData.certifications = list;
    notifyListeners();
  }

  // ─── Internships ────────────────────────────────────────────────────────────

  void addInternship() {
    resumeData.internships = [...resumeData.internships, InternshipEntry()];
    notifyListeners();
  }

  void updateInternship(int index, InternshipEntry entry) {
    final list = List<InternshipEntry>.from(resumeData.internships);
    list[index] = entry;
    resumeData.internships = list;
    notifyListeners();
  }

  void removeInternship(int index) {
    final list = List<InternshipEntry>.from(resumeData.internships);
    list.removeAt(index);
    resumeData.internships = list;
    notifyListeners();
  }
}


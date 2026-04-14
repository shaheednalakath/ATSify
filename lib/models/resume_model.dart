// ─── Entry Models ────────────────────────────────────────────────────────────

class ExperienceEntry {
  String jobTitle;
  String company;
  String duration;
  String description;

  ExperienceEntry({
    this.jobTitle = '',
    this.company = '',
    this.duration = '',
    this.description = '',
  });

  ExperienceEntry copyWith({
    String? jobTitle,
    String? company,
    String? duration,
    String? description,
  }) =>
      ExperienceEntry(
        jobTitle: jobTitle ?? this.jobTitle,
        company: company ?? this.company,
        duration: duration ?? this.duration,
        description: description ?? this.description,
      );
}

class ProjectEntry {
  String name;
  String description;
  String technologies;
  String link;

  ProjectEntry({
    this.name = '',
    this.description = '',
    this.technologies = '',
    this.link = '',
  });

  ProjectEntry copyWith({
    String? name,
    String? description,
    String? technologies,
    String? link,
  }) =>
      ProjectEntry(
        name: name ?? this.name,
        description: description ?? this.description,
        technologies: technologies ?? this.technologies,
        link: link ?? this.link,
      );
}

class EducationEntry {
  String degree;
  String institution;
  String year;

  EducationEntry({
    this.degree = '',
    this.institution = '',
    this.year = '',
  });

  EducationEntry copyWith({
    String? degree,
    String? institution,
    String? year,
  }) =>
      EducationEntry(
        degree: degree ?? this.degree,
        institution: institution ?? this.institution,
        year: year ?? this.year,
      );
}

class CertificationEntry {
  String name;
  String organization;

  CertificationEntry({
    this.name = '',
    this.organization = '',
  });

  CertificationEntry copyWith({String? name, String? organization}) =>
      CertificationEntry(
        name: name ?? this.name,
        organization: organization ?? this.organization,
      );
}

class InternshipEntry {
  String role;
  String company;
  String description;

  InternshipEntry({
    this.role = '',
    this.company = '',
    this.description = '',
  });

  InternshipEntry copyWith({
    String? role,
    String? company,
    String? description,
  }) =>
      InternshipEntry(
        role: role ?? this.role,
        company: company ?? this.company,
        description: description ?? this.description,
      );
}

// ─── Main Resume Model ────────────────────────────────────────────────────────

class ResumeModel {
  // Common Fields
  String name;
  String email;
  String phone;
  String location;
  String summary;
  List<String> skills;

  // Section Fields
  List<ExperienceEntry> experience;
  List<ProjectEntry> projects;
  List<EducationEntry> education;
  List<CertificationEntry> certifications;
  List<InternshipEntry> internships;

  ResumeModel({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.location = '',
    this.summary = '',
    this.skills = const [],
    this.experience = const [],
    this.projects = const [],
    this.education = const [],
    this.certifications = const [],
    this.internships = const [],
  });
}


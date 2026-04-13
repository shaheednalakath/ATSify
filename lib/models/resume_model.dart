class ResumeModel {
  String name;
  String email;
  String phone;
  String summary;
  List<String> skills;

  ResumeModel({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.summary = '',
    this.skills = const [],
  });
}

import 'package:flutter_test/flutter_test.dart';

import 'package:atsify/providers/resume_provider.dart';

void main() {
  testWidgets('ResumeProvider initializes correctly', (WidgetTester tester) async {
    // Test provider initialization (no Firebase needed)
    final provider = ResumeProvider();

    expect(provider.resumeData.name, '');
    expect(provider.resumeData.email, '');
    expect(provider.resumeData.phone, '');
    expect(provider.resumeData.summary, '');
    expect(provider.resumeData.skills, isEmpty);
    expect(provider.selectedTemplate, 'default');
  });

  testWidgets('ResumeProvider update methods work', (WidgetTester tester) async {
    final provider = ResumeProvider();

    provider.updateName('John Doe');
    expect(provider.resumeData.name, 'John Doe');

    provider.updateEmail('john@example.com');
    expect(provider.resumeData.email, 'john@example.com');

    provider.changeTemplate('modern');
    expect(provider.selectedTemplate, 'modern');

    provider.updateSkills(['Dart', 'Flutter']);
    expect(provider.resumeData.skills.length, 2);
  });
}

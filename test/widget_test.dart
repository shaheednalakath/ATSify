import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:atsify/main.dart';
import 'package:atsify/providers/resume_provider.dart';

void main() {
  testWidgets('App launches and shows TemplateSelectionScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ResumeProvider()),
        ],
        child: const ATSifyApp(),
      ),
    );

    // Verify that ATSify title is shown
    expect(find.text('Choose Template'), findsOneWidget);
    
    // Verify Start Building Resume button exists
    expect(find.text('Classic Template'), findsOneWidget);
  });
}

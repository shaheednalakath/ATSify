import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:atsify/main.dart';

void main() {
  testWidgets('App launches and shows TemplateSelectionScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ATSifyApp());

    // Verify that ATSify title is shown
    expect(find.text('ATSify'), findsOneWidget);
    
    // Verify Start Building Resume button exists
    expect(find.text('Start Building Resume'), findsOneWidget);
  });
}

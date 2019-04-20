import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_birb/pages/home_page.dart';
import 'package:flutter_birb/posts_list.dart';
import 'package:flutter_birb/sign_in_fab.dart';

void main() {
  const MaterialApp app = MaterialApp(
    home: HomePage(title: 'Awesome'),
  );

  testWidgets('Renders list of posts', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app);

    expect(find.text('Awesome'), findsOneWidget);
    expect(find.byType(PostsList), findsOneWidget);
  });

  testWidgets('Renders sign in FAB', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app);

    expect(find.byType(SignInFab), findsOneWidget);
  });
}
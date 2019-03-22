import 'package:flutter/material.dart';
import 'package:flutter_birb/no_content.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Render Content', (WidgetTester tester) async {
    const String text = 'No Birds a birbing';

    await tester.pumpWidget(
      const MaterialApp(
        home: NoContent(),
      ),
    );

    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.text(text), findsOneWidget);
  });
}

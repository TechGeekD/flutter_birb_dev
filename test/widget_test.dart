import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_birb/main.dart';

void main() {
  testWidgets('Renders content', (WidgetTester tester) async {
    const String text = 'No Birds Birbing';

    await tester.pumpWidget(MyApp());

    expect(find.text(text), findsOneWidget);
  });
}

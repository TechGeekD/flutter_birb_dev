import 'package:flutter_birb/no_content.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_birb/main.dart';

void main() {
  testWidgets('Renders content', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());

    expect(find.byType(NoContent), findsOneWidget);
  });
}

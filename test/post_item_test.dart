import 'package:flutter/material.dart';
import 'package:flutter_birb/post_item.dart';
import 'package:flutter_birb/models/post_mock.dart';
import 'package:flutter_birb/models/posts_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets('Renders a post', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final Post post = mockPost();
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: PostItem(post),
      ));

      expect(find.byType(Image), findsOneWidget);
      expect(find.text(post.username), findsOneWidget);
      expect(find.text(post.text), findsOneWidget);
    });
  });
}

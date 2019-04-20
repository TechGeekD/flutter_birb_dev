import 'package:flutter_birb/models/post_mock.dart';
import 'package:flutter_birb/models/posts_map.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Post', () {
    test('fromMap', () {
      final Map<String, dynamic> data = mockPostData();
      final Post post = Post.fromMap(data);

      expect(post.id, data['id']);
      expect(post.username, data['username']);
      expect(post.imageUrl, data['imageUrl']);
      expect(post.createdAt, DateTime.parse(data['createdAt']));
      expect(post.text, data['text']);
    });
  });
}
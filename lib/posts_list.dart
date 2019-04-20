import 'package:flutter/material.dart';
import 'package:flutter_birb/no_content.dart';
import 'package:flutter_birb/post_item.dart';
import 'package:flutter_birb/models/posts_map.dart';

class PostsList extends StatelessWidget {
  const PostsList({this.posts});

  final Stream<List<Post>> posts;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      stream: posts,
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading...');
            break;
          default:
            if (snapshot.data == null || snapshot.data.isEmpty) {
              return const NoContent();
            }
            return _itemList(snapshot.data);
        }
      },
    );
  }

  Widget _itemList(List<Post> _items) {
    return ListView(
      children: _items.map((Post post) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: PostItem(post),
        );
      }).toList(),
    );
  }
}

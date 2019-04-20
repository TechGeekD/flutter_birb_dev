import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_birb/models/post_mock.dart';
import 'package:flutter_birb/models/posts_map.dart';
import 'package:flutter_birb/posts_list.dart';
import 'package:flutter_birb/services/auth.dart';
import 'package:flutter_birb/sign_in_fab.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        elevation: 0.0,
      ),
      body: PostsList(posts: _loadPosts(context)),
      floatingActionButton: SignInFab(
        auth: Auth(
          firebaseAuth: FirebaseAuth.instance,
          googleSignIn: GoogleSignIn(),
        ),
      ),
    );
  }

  Stream<List<Post>> _loadPosts(BuildContext context) {
    final List<List<dynamic>> mockSnapshot = <List<dynamic>>[
      List<dynamic>.generate(10, (int index) => mockPostData(index: index))
    ];
    return Stream<List<dynamic>>.fromIterable(mockSnapshot)
        .map(_convertToPosts);
  }

  List<Post> _convertToPosts(List<dynamic> data) {
    return data.map((dynamic item) => Post.fromMap(item)).toList();
  }
}

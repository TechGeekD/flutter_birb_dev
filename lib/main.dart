import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_birb/pages/home_page.dart';
import 'package:flutter_birb/pages/register_page.dart';
import 'package:flutter_birb/theme.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(lightSystemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Birb',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(title: 'Birb'),
      routes: <String, WidgetBuilder>{
        RegisterPage.routeName: (BuildContext context) => const RegisterPage(),
      },
    );
  }
}

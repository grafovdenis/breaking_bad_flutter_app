import 'package:flutter/material.dart';
import 'package:breaking_bad_flutter_app/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Breaking Bad Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'The Breaking Bad Flutter App'),
    );
  }
}



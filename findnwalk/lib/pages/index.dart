import 'package:flutter/material.dart';
import 'package:findnwalk/pages/loginPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FindNWalk',
      home: Index(title: 'FindNwalk'),
    );
  }
}

class Index extends StatefulWidget {
  Index({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              LoginPage(),
            ],
          ),
        ),
      ),
    );
  }
}
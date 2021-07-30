import 'package:findnwalk/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:findnwalk/pages/loginPage.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FindNWalk',
      home: LoginPage(),
      theme: ThemeData(
        primaryColor: Cores.laranja
      ),
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
    return LoginPage();
  }
  
}
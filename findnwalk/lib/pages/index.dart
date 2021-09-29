import 'package:findnwalk/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:findnwalk/pages/loginPage.dart';

/*
  Página índice do aplicativo, não é uma página acessível no app
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FindNWalk',
      home: LoginPage(),
      theme: ThemeData(
        primaryColor: AppColors.orange
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
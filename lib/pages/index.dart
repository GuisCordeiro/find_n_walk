import 'package:findnwalk/components/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:findnwalk/pages/login/loginPage.dart';

/*
  Página índice do aplicativo, não é uma página acessível no app
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.orange,
          
        )
      ),
      debugShowCheckedModeBanner: false,
      title: 'FindNWalk',
      home: LoginPage(),
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

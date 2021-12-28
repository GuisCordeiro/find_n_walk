import 'package:flutter/material.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/pages/login/loginPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColors.orange,
            ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'FindNWalk',
      home: LoginPage(),
    );
  }
}

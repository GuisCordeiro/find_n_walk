import 'package:findnwalk/components/barraInferior.dart';
import 'package:flutter/material.dart';
import 'package:findnwalk/controller/variaveis.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//int num = 3;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BarraInferior(),
      body: SafeArea(
        child: ListView(
          children: [

        ],
        ),
      ),
    );
  }
}
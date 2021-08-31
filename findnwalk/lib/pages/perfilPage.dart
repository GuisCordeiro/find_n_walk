import 'package:findnwalk/controller/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({ Key? key }) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}


class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Text('Perfil page')
        ],
        ),
      ),
    );
  }
}
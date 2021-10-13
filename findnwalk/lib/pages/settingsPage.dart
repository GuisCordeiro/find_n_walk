import 'package:findnwalk/components/colors.dart';
import 'package:flutter/material.dart';

/*
  Página de Configurações
*/

class SettingsPage extends StatefulWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
          title: Text(
            'Configurações',
            style: TextStyle(
              color: AppColors.black
            ),
          ),
        ),
      body: SafeArea(
        child: ListView(
          children: [
            Text('Settings Page')
          ],
        ),
      ),
    );
  }
}
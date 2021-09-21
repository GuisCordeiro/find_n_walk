import 'package:findnwalk/components/appBar.dart';
import 'package:findnwalk/pages/settingsPage.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: FNAppBar('Perfil', Icon(Icons.settings),SettingsPage(),true)
      ),
      body: SafeArea(
        child: ListView(
            children: [
              
          ],
        ),
      ),
    );
  }
}
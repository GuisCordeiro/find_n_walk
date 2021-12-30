import 'package:findnwalk/components/profile/edit_bio_card.dart';
import 'package:findnwalk/components/shared/app_bar.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:flutter/material.dart';

import '../settings/settings_page.dart';

/*
  Página de perfil
*/

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child:
              FNAppBar('Perfil', Icon(Icons.settings), SettingsPage(), true)),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Text("Nome do Usuário",
                      style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                Text('Biografia'),
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return editBioCard();
                        });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

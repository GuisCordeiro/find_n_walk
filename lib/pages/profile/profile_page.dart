import 'package:findnwalk/components/profile/edit_bio_card.dart';
import 'package:findnwalk/components/shared/app_bar.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:flutter/material.dart';

/*
  Página de perfil
*/

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: FNAppBar(
          pageName: 'Perfil',
          icon: null,
          page: null,
          arrow: true,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Olá, ${LoginController.user!.name}!",
                    style: const TextStyle(
                      color: AppColors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Biografia:"),
                      ),
                      GestureDetector(
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              LoginController.user!.bio ??
                                  "Hello there, I am using Find N'Walk!",
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return EditBioCard(_refresh);
                            },
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

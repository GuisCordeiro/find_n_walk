import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:flutter/material.dart';

import '../shared/colors.dart';
import '../shared/app_button.dart';

class EditBioCard extends StatelessWidget {
  final _bioFieldController = TextEditingController();

  EditBioCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      title: const Text(
        'Editar Biografia',
        style: TextStyle(
          color: AppColors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _bioFieldController,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Insira sua biografia...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        //TODO mudar bio
        AppButton(
          label: 'Enviar',
          onTap: () async {
            String userId = LoginController.user!.id!;
            await Database.updateUser(
              userId,
              {
                'bio': _bioFieldController.text,
              },
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

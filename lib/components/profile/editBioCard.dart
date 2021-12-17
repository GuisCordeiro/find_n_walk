import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/orangeButton.dart';
import 'package:flutter/material.dart';

editBioCard() {
  return AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25))),
    title: Text('Editar Biografia',
        style: TextStyle(
            color: AppColors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 20)),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: 'Insira sua biografia...',
              border: OutlineInputBorder()),
        ),
      ),
      Botao('Enviar')
    ],
  );
}

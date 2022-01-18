import 'package:flutter/material.dart';

import '../shared/colors.dart';
import '../shared/orange_button.dart';

editBioCard() {
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
          decoration: const InputDecoration(
            hintText: 'Insira sua biografia...',
            border: OutlineInputBorder(),
          ),
        ),
      ),
      const Botao('Enviar'),
    ],
  );
}

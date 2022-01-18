import 'package:flutter/material.dart';

import 'colors.dart';

/*
  Esse é o campo de preenchimento dos formulários, você só precisa passar a string
  que ficará dentro do campo de preenchimeto (o placeholder).
  A chamada desse componente é: Formulário('string')
*/

// TODO convert to Stateful Widget

class AppForm extends StatelessWidget {
  final String label;
  final bool decision;
  final Icon icon;
  final TextEditingController formController;

  const AppForm(this.label, this.icon, this.decision, this.formController,
      {Key? key})
      : super(key: key);

  @override
  void dispose() {
    formController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: TextField(
        controller: formController,
        obscureText: decision,
        cursorColor: AppColors.orange,
        decoration: InputDecoration(
          prefixIcon: icon,
          focusColor: AppColors.orange,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.orange)),
          hintText: label,
        ),
      ),
    );
  }
}

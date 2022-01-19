import 'package:flutter/material.dart';

import 'colors.dart';

/*
  Formulário genérico utilizado no aplicativo
*/

class AppForm extends StatefulWidget {
  final String label;
  final bool decision;
  final Icon icon;
  final TextEditingController controller;

  const AppForm(
      {required this.label,
      required this.icon,
      required this.decision,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
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
        controller: widget.controller,
        obscureText: widget.decision,
        cursorColor: AppColors.orange,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          focusColor: AppColors.orange,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.orange),
          ),
          hintText: widget.label,
        ),
      ),
    );
  }
}

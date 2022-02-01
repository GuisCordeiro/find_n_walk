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
  final bool? validate;
  final String? errorMessage;

  const AppForm(
      {required this.label,
      required this.icon,
      required this.decision,
      required this.controller,
      this.validate,
      this.errorMessage,
      Key? key})
      : super(key: key);

  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  bool getValidate() {
    bool validate = false;
    if (widget.validate != null) {
      validate = widget.validate!;
    }
    return validate;
  }

  String getErrorMessage() {
    String message = "Dado incorreto ou faltante";
    if (widget.errorMessage != null) {
      message = widget.errorMessage!;
    }
    return message;
  }

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
          errorText: getValidate() ? getErrorMessage() : null,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.grey)),
        ),
      ),
    );
  }
}

import 'package:findnwalk/data/providers/mock.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

import 'colors.dart';

// Um componente customizado de seleção com um controlador.

class CustomSelectFormField extends StatelessWidget {
  final String label;

  final Icon icon;

  final TextEditingController controller;

  const CustomSelectFormField({
    required this.label,
    required this.icon,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: SelectFormField(
        type: SelectFormFieldType.dropdown,
        controller: controller,
        items: items,
        decoration: InputDecoration(
          prefixIcon: icon,
          focusColor: AppColors.orange,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.orange),
          ),
          hintText: label,
        ),
      ),
    );
  }
}

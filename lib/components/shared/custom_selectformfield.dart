import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

import 'colors.dart';

/*
  Esse é o campo de preenchimento dos formulários, você só precisa passar a string
  que ficará dentro do campo de preenchimeto (o placeholder).
  A chamada desse componente é: Formulário('string')
*/

class CustomSelectFormField extends StatelessWidget {
  final String label;
  final Icon icon;
  final TextEditingController formController;
  final List<Map<String, dynamic>> _items;

  const CustomSelectFormField(this.label, this.icon, this.formController, this._items);

  void dispose() {
    formController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SelectFormField(
          type: SelectFormFieldType.dropdown,
          controller: formController,
          items: _items,
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
        ));
  }
}

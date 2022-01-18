import 'package:flutter/material.dart';

import 'colors.dart';

/*
  Componente de checkbox básico, ele recebe o texto que fica ao lado como uma String
*/

class CheckboxLaranja extends StatefulWidget {
  final String label;

  const CheckboxLaranja(this.label, {Key? key}) : super(key: key);

  @override
  _CheckboxLaranjaState createState() => _CheckboxLaranjaState();
}

class _CheckboxLaranjaState extends State<CheckboxLaranja> {
  bool selecionado = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.label,
        style: const TextStyle(color: AppColors.grey),
      ),
      activeColor: AppColors.orange,
      checkColor: AppColors.white,
      controlAffinity: ListTileControlAffinity.leading,
      value: selecionado,
      onChanged: (bool? value) {
        setState(() {
          selecionado = value!;
        });
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'colors.dart';

class CheckboxLaranja extends StatefulWidget {
  String label;
  CheckboxLaranja(this.label);

  @override
  _CheckboxLaranjaState createState() => _CheckboxLaranjaState();
}

class _CheckboxLaranjaState extends State<CheckboxLaranja> {
  bool selecionado = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
              title: Text(
                '${widget.label}',
                style: TextStyle(
                  color: AppColors.grey
                ),
              ),
              activeColor: AppColors.orange,
              checkColor: AppColors.white,
              controlAffinity: ListTileControlAffinity.leading,
              value: selecionado,
              onChanged: (bool? value){
                setState(() {
                  selecionado = value!;
                });
              },
            );
  }
}



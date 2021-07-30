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
                  color: Cores.cinza
                ),
              ),
              activeColor: Cores.laranja,
              checkColor: Cores.branco,
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



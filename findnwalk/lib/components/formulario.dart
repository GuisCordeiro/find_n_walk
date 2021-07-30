import 'package:flutter/material.dart';
import 'colors.dart';


/*
  Esse é o campo de preenchimento dos formulários, você só precisa passar a string
  que ficará dentro do campo de preenchimeto (o placeholder).
  A chamada desse componente é: Formulário('string')
*/

class Formulario extends StatelessWidget {
  String label;
  Formulario(this.label);
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                cursorColor: Cores.laranja,
                decoration: InputDecoration(
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Cores.cinza
                  )
                ),
                focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Cores.laranja
                  )
                ),
                hintText: '$label',
                ),
              ),
    );
  }
}
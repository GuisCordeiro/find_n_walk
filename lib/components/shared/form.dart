import 'package:flutter/material.dart';
import 'colors.dart';


/*
  Esse é o campo de preenchimento dos formulários, você só precisa passar a string
  que ficará dentro do campo de preenchimeto (o placeholder).
  A chamada desse componente é: Formulário('string')
*/

class AppForm extends StatelessWidget {
  final String label;
  final bool decision;
  final Icon icon;

  AppForm(this.label, this.icon, this.decision);

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                obscureText: decision,
                cursorColor: AppColors.orange,
                decoration: InputDecoration(
                prefixIcon: icon,
                focusColor: AppColors.orange,
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.grey
                  )
                ),
                focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.orange
                  )
                ),
                hintText: '$label',
                ),
              ),
    );
  }
}

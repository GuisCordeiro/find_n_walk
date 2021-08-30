import 'package:flutter/material.dart';
import 'colors.dart';

class Botao extends StatelessWidget {
  String texto;
  Botao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
      child: Container(
        width: MediaQuery.of(context).size.width/3,
        height: MediaQuery.of(context).size.height/20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.orange
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            '$texto',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors.white
            ),
          ),
        ),
      ),
    );
               
  }
}
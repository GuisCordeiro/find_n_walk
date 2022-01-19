import 'package:flutter/material.dart';

import 'colors.dart';

/*
  Componente de botão laranja, recebe o texto do botão como uma String
*/

class AppButton extends StatelessWidget {
  final String label;

  final GestureTapCallback onTap;

  const AppButton({required this.label, required this.onTap, Key? key})
      : super(key: key);

  // Early prototype

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: AppColors.orange),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

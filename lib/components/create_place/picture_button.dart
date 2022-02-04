import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/controllers/picture_button_controller.dart';
import 'package:flutter/material.dart';

class PictureButton extends StatefulWidget {
  final PictureButtonController controller;

  const PictureButton({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  _PictureButtonState createState() => _PictureButtonState();
}

class _PictureButtonState extends State<PictureButton> {
  @override
  Widget build(BuildContext context) {
    if (!widget.controller.used) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: Container(
          height: 57,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 2.0),
              primary: Colors.red,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.close),
                Text('  Clique aqui para adicionar uma foto do local'),
              ],
            ),
            onPressed: () async {
              await widget.controller.getPicture();
              setState(() {});
            },
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: Container(
          height: 57,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 2.0),
              primary: Colors.green,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.check),
                Text('  Foto adicionada com sucesso'),
              ],
            ),
            onPressed: () {},
          ),
        ),
      );
    }
  }
}

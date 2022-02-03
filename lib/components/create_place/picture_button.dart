import 'package:findnwalk/components/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureButton extends StatefulWidget {
  PictureButton({Key? key}) : super(key: key);

  bool usedOnce = false;

  String thumbnailPath = '';

  List<String> otherImagePaths = [];

  @override
  _PictureButtonState createState() => _PictureButtonState();
}

class _PictureButtonState extends State<PictureButton> {
  @override
  Widget build(BuildContext context) {
    if (!widget.usedOnce) {
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
                Text('  Clique aqui para adicionar uma foto principal'),
              ],
            ),
            onPressed: () async {
              final image = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                imageQuality: 100,
              );
              if (image != null) {
                widget.thumbnailPath = image.path;
                setState(
                  () {
                    widget.usedOnce = true;
                  },
                );
              } else {
                print('Algo deu errado ao adicionar thumbnail...');
              }
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
                Text('  Clique aqui para adicionar mais fotos'),
              ],
            ),
            onPressed: () async {
              final image = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                imageQuality: 100,
              );
              if (image != null) {
                widget.otherImagePaths.add(image.path);
              } else {
                print('Algo deu errado ao adicionar fotos extras...');
              }
            },
          ),
        ),
      );
    }
  }
}

import 'dart:io';
import 'package:findnwalk/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PerfilImagePicker extends StatefulWidget {
  
  @override
  _PerfilImagePickerState createState() => _PerfilImagePickerState();
}

class _PerfilImagePickerState extends State<PerfilImagePicker> {
  var _image;
  ImagePicker picker = ImagePicker();
  _imgFromCamera() async {
  File image = await picker.getImage(
    source: ImageSource.camera, imageQuality: 50
  ) as File;

  setState(() {
    _image = image;
  });
}

_imgFromGallery() async {
  File image = await  picker.getImage(
      source: ImageSource.gallery, imageQuality: 50
  ) as File;

  setState(() {
    _image = image;
  });
}

void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Galeria'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Câmera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        
      }
    );
}

  @override
Widget build(BuildContext context) {
  return Column(
      children: <Widget>[
        SizedBox(
          height: 32,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor: AppColors.orange,
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        _image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: AppColors.black,
                      ),
                    ),
            ),
          ),
        )
      ],
  );
}
}
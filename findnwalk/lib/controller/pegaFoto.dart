import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


/*
  Este controller serve para pegar a foto da galeria do celular do usuário
*/

class PegaImagem extends StatefulWidget {
  const PegaImagem({ Key? key }) : super(key: key);

  @override
  _PegaImagemState createState() => _PegaImagemState();
}

class _PegaImagemState extends State<PegaImagem> {
  imgFromCamera() async {
  var image = await ImagePicker.pickImage(
    source: ImageSource.camera, imageQuality: 50
  );

  setState(() {
    var _image = image;
  });
}

_imgFromGallery() async {
  var image = await  ImagePicker.pickImage(
      source: ImageSource.gallery, imageQuality: 50
  );

  setState(() {
    var _image = image;
  });
}
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
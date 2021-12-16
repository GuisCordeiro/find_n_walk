import 'dart:ffi';

import 'package:flutter/material.dart';

class Place {
  //Nome do local
  String name;

  //Local (trocar para "Location" ou outra classe que suporte cordenadas geográficas)
  String address;
  
  //Descrição do local
  String description;

  //Público (true) ou Privado (false)
  bool public;

  //Categorias esportivas
  List<String> cathegory;

  //foto principal
  Image thumbnail;

  //fotos do local
  List<Image>? picture;

  //Nota do local --> 1 a 5 estrelas
  Float? rate;

  //Capacidade de pessoas
  int capacity;

  Place(this.name, this.address, this.description, this.public, this.cathegory, this.thumbnail, this.capacity);
}

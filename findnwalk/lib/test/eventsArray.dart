import 'package:findnwalk/api/eventClass.dart';
import 'package:flutter/material.dart';

var eventosDeTeste = [
  Events(
      'Futevôlei com Aninha',
      'Futevolei',
      DateTime.parse("2021-10-13 14:08"),
      TimeOfDay(hour: 2, minute: 30),
      "Rua dos bobos, nº 0, bairro do Limeiro",
      10,
      5,
      "lorem ipsum dolor sit amet",
      Icons.sports_volleyball),
  Events(
      'Futebas do marcola',
      "Futebol",
      DateTime.parse("2021-09-01 16:30"),
      TimeOfDay(hour: 3, minute: 0),
      "Rua Juquinha, nº143, Centro",
      20,
      3,
      "Vai que tá bão demais",
      Icons.sports_soccer)
];

//classe que representa os eventos

import 'package:flutter/material.dart';

class Events {
  //título
  String title;

  //categoria
  String cathegory;

  //horário de início
  DateTime startTime;

  //duração
  TimeOfDay duration;

  //Local (trocar para "Location" ou outra classe que suporte cordenadas geográficas)
  String location;

  //Número de participantes máximo
  int maxMembers;

  //Número de participantes atuais
  int currentMembers;

  //Descrição do evento
  String description;

  //Icone do esporte
  IconData iconName;

  //construtor
  Events(
      this.title,
      this.cathegory,
      this.startTime,
      this.duration,
      this.location,
      this.maxMembers,
      this.currentMembers,
      this.description,
      this.iconName);
}

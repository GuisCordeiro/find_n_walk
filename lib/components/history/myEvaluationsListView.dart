import 'package:findnwalk/test/eventsArray.dart';
import 'package:flutter/material.dart';
import 'evaluationTile.dart';

evaluatedPlaces() {
  //gera dinamicamente uma lista de lugares avaliados com o arquivo de teste eventsArray.dart (Basta puxar do Firebase ao inves de eventosDeTeste, após implementado)
  return ListView.separated(
    itemCount: eventosDeTeste.length,
    itemBuilder: (context, index) => evaluationTile(eventosDeTeste[index], context),
    separatorBuilder: (context, index) => Divider(),
  );
}
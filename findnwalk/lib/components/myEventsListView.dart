import 'package:findnwalk/components/eventTile.dart';
import 'package:findnwalk/test/eventsArray.dart';
import 'package:flutter/material.dart';

myEvents() {
  //gera dinamicamente uma lista de eventTiles com o arquivo de teste eventsArray.dart (Basta puxar do Firebase ao inves de eventosDeTeste, após implementado)
  return ListView.separated(
    itemCount: eventosDeTeste.length,
    itemBuilder: (context, index) => eventTile(eventosDeTeste[index]),
    separatorBuilder: (context, index) => Divider(),
  );
}


import 'package:findnwalk/components/places/placeTile.dart';
import 'package:findnwalk/test/eventsArray.dart';
import 'package:flutter/material.dart';

FavoritePlaces() {
  //gera dinamicamente uma lista de eventTiles com o arquivo de teste eventsArray.dart (Basta puxar do Firebase ao inves de eventosDeTeste, após implementado)
  return ListView.separated(
    itemCount: lugaresDeTeste.length,
    itemBuilder: (context, index) => placeTile(lugaresDeTeste[index], context),
    separatorBuilder: (context, index) => Divider(),
  );
}

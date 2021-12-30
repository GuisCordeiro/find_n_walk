import 'package:findnwalk/data/providers/mock.dart';
import 'package:flutter/material.dart';

import 'place_tile.dart';

FavoritePlaces() {
  //gera dinamicamente uma lista de eventTiles com o arquivo de teste eventsArray.dart (Basta puxar do Firebase ao inves de eventosDeTeste, após implementado)
  return ListView.separated(
    itemCount: lugaresDeTeste.length,
    itemBuilder: (context, index) => placeTile(lugaresDeTeste[index], context),
    separatorBuilder: (context, index) => Divider(),
  );
}

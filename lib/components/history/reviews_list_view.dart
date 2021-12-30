import 'package:findnwalk/data/providers/mock.dart';
import 'package:flutter/material.dart' show Divider, ListView;

import 'review_tile.dart';

reviewedPlaces() {
  // Gera dinamicamente uma lista de lugares avaliados com o arquivo de teste eventsArray.dart
  // (Basta puxar do Firebase ao inves de eventosDeTeste, após implementado)
  return ListView.separated(
    itemCount: lugaresDeTeste.length,
    itemBuilder: (context, index) => reviewTile(lugaresDeTeste[index], context),
    separatorBuilder: (context, index) => Divider(),
  );
}

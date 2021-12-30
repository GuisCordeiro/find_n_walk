import 'package:findnwalk/data/models/place.dart';
import 'package:flutter/material.dart';

import 'place_card.dart';


placeTile(Place place, BuildContext context) {
  return ListTile(
      title: Text(place.name),
      subtitle: Text(place.cathegory.toString()),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          checkThumbnail(place),
        ],
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return placeCard(place);
            });
      });
}

checkThumbnail(Place place) {
  if (place.thumbnail == null) {
    return Container(width: 10, height: 10);
  } else {
    return Image.file(place.thumbnail!);
  }
}

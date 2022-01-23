import 'package:findnwalk/data/models/place.dart';
import 'package:flutter/material.dart';

import '../../pages/place/place_page.dart';

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
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlacePage(place: place),
            ));
      });
}

checkThumbnail(Place place) {
  if (place.thumbnail == null) {
    return const SizedBox(width: 10, height: 10);
  } else {
    return Image.file(place.thumbnail!);
  }
}

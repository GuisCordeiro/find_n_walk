import 'package:findnwalk/data/models/place.dart';
import 'package:flutter/material.dart';

import '../../pages/place/place_page.dart';

class PlaceTile extends StatelessWidget {
  final Place place;
  const PlaceTile({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(place.name),
      subtitle: Text(splitString(place.cathegory.toString())),
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
          ),
        );
      },
    );
  }

  dynamic checkThumbnail(Place place) {
    if (place.thumbnail == null) {
      return const SizedBox(width: 10, height: 10);
    } else {
      return Image.asset(place.thumbnail!);
    }
  }

  String splitString(String list) {
    return list.split('[')[1].split(']')[0];
  }
}

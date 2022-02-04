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
      subtitle: Text(place.cathegories.join(', ')),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(width: 10, height: 10),
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
}

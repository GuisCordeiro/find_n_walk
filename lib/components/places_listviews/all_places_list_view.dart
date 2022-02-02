import 'package:findnwalk/data/providers/mock.dart';
import 'package:flutter/material.dart';

import 'place_tile.dart';

class AllPlaces extends StatelessWidget {
  const AllPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: lugaresDeTeste.length,
      itemBuilder: (context, index) => PlaceTile(place: lugaresDeTeste[index]),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

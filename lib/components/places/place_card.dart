import 'package:findnwalk/data/models/place.dart';
import 'package:flutter/material.dart';

import '../shared/colors.dart';
import '../shared/favorite_button.dart';

placeCard(Place place) {
  return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      title: Text(place.name,
          style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 25)),
      actions: [
        Center(
          child: Column(
            children: [
              isPublic(place),
              space(height: 30),
              titleText("Categorias"),
              commonText(place.cathegory.toString()),
              space(),
              titleText("Local"),
              commonText(place.address),
              space(),
              titleText("Capacidade máxima"),
              commonText(place.capacity.toString()),
              space(),
              titleText("Descrição"),
              commonText(place.description),
              space(),
              FavoriteButton(favorite: false),
            ],
          ),
        ),
      ]);
}

titleText(String text) {
  return Text(
    text,
    style: TextStyle(
        color: AppColors.orange, fontWeight: FontWeight.bold, fontSize: 20),
  );
}

commonText(String text) {
  return Text(
    text,
    style: TextStyle(color: AppColors.black, fontSize: 15),
  );
}

space({double? height}) {
  if (height == null) {
    return Container(
      height: 10,
    );
  } else {
    return Container(height: height);
  }
}

isPublic(Place place) {
  if (place.isPublic) {
    return titleText("Local Público");
  } else {
    return titleText("Local Privado");
  }
}

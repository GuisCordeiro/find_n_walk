import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/favorite_button.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:flutter/material.dart';

class PlacePage extends StatelessWidget {
  final Place place;
  const PlacePage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: Text(place.name,
              style: const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ))),
      body: Column(
        children: [
          space(height: 30),
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
          const FavoriteButton(favorite: false),
        ],
      ),
    );
  }

  titleText(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: AppColors.orange, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  commonText(String text) {
    return Text(
      text,
      style: const TextStyle(color: AppColors.black, fontSize: 15),
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
}

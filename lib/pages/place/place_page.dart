import 'package:findnwalk/components/place/places_pictures_listview.dart';
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
          space(height: 10),
          PlacesPictures(place: place),
          space(height: 30),
          isPublic(place),
          SizedBox(
            height: 250,
            child: Column(
              children: [
                Row(
                  children: [
                    block(
                        title: "Categorias",
                        subtitle: place.cathegory.toString()),
                    block(title: "Local", subtitle: place.address),
                  ],
                ),
                Row(
                  children: [
                    block(
                        title: "Capacidade máxima",
                        subtitle: place.capacity.toString()),
                    block(title: "Descrição", subtitle: place.description),
                  ],
                )
              ],
            ),
          ),
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

  block({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          padding: const EdgeInsets.all(8),
          height: 100,
          width: 175,
          child: Column(
            children: [titleText(title), commonText(subtitle)],
          )),
    );
  }
}

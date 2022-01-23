import 'package:findnwalk/components/place/author_block.dart';
import 'package:findnwalk/components/place/is_public_block.dart';
import 'package:findnwalk/components/place/places_pictures_listview.dart';
import 'package:findnwalk/components/place/text_block.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/favorite_button.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/mock.dart';
import 'package:flutter/material.dart';

class PlacePage extends StatelessWidget {
  final Place place;
  const PlacePage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.63,
                child: Flexible(
                  child: Text(place.name,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              const Spacer(),
              //TODO adicionar controlador do botão de favorito
              const FavoriteButton(favorite: false),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            space(),
            PlacesPictures(place: place),
            space(),
            IsPublicBlock(place: place),
            //TODO é necessário que id do registrador do local seja usado para localizar o usuário de forma que seus dados possam ser passados para este widget
            AuthorBlock(user: usuariosDeTeste[0]),
            TextBlock(
              title: "Categorias",
              subtitle: place.cathegory.toString(),
              context: context,
            ),
            TextBlock(
              title: "Local",
              subtitle: place.address,
              context: context,
            ),
            TextBlock(
              title: "Capacidade máxima",
              subtitle: place.capacity.toString(),
              context: context,
            ),
            TextBlock(
              title: "Descrição",
              subtitle: place.description,
              context: context,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }

  space({double? height}) {
    height ??= 10;
    return Container(height: height);
  }
}

import 'package:findnwalk/components/place/author_block.dart';
import 'package:findnwalk/components/place/is_public_block.dart';
import 'package:findnwalk/components/place/places_pictures_listview.dart';
import 'package:findnwalk/components/place/text_block.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/favorite_button.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/database.dart';
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
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.63,
              child: Flexible(
                child: Text(
                  place.name,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(),
            // HACK o botão meio que se auto-controla
            FavoriteButton(
              placeId: place.id!,
              favorite:
                  LoginController.user!.favoritePlaces.contains(place.id!),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            space(),
            PlacesPictures(place: place),
            space(),
            IsPublicBlock(place: place),
            // NOTE é preciso carregar o usuário para gerar
            // o AuthorBlock da página.
            FutureBuilder(
              future: Database.getUser(place.creatorId),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return AuthorBlock(user: snapshot.data);
                }
                return const TextBlock(
                    title: 'Por favor, aguarde', subtitle: 'Carregando...');
              },
            ),
            TextBlock(
              title: "Categorias:",
              subtitle: place.cathegories.join(', '),
            ),
            TextBlock(
              title: "Local:",
              subtitle: place.address.toString(),
            ),
            TextBlock(
              title: "Capacidade máxima:",
              subtitle: place.capacity == 0 ? "Não informado" : place.capacity.toString(),
            ),
            TextBlock(
              title: "Descrição:",
              subtitle: place.description,
              height: 200,
            ),
            space(),
          ],
        ),
      ),
    );
  }

  SizedBox space({double height = 10}) {
    return SizedBox(height: height);
  }
}

import 'package:flutter/material.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:findnwalk/controllers/login_controller.dart';

class FavoriteButton extends StatefulWidget {
  final String placeId;

  final bool favorite;

  const FavoriteButton({
    Key? key,
    required this.placeId,
    required this.favorite,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final userId = LoginController.user!.id!;

  final userFavorites = LoginController.user!.favoritePlaces;

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    if (userFavorites.contains(widget.placeId)) {
      isFavorite = true;
    } else {
      isFavorite = false;
    }
    if (isFavorite == false) {
      return IconButton(
        color: Colors.red,
        onPressed: () async {
          isFavorite = true;
          // LoginController.user!.favoritePlaces.add(widget.placeId);
          userFavorites.add(widget.placeId);
          await Database.updateUser(
            userId,
            {
              'favorite_places': userFavorites,
            },
          );
          setState(() {});
        },
        icon: const Icon(Icons.favorite_border),
      );
    } else {
      return IconButton(
        color: Colors.red,
        onPressed: () async {
          isFavorite = false;
          userFavorites.remove(widget.placeId);
          await Database.updateUser(
            userId,
            {
              'favorite_places': userFavorites,
            },
          );
          setState(() {});
        },
        icon: const Icon(Icons.favorite, color: Colors.red),
      );
    }
  }
}

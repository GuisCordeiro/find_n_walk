import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:flutter/painting.dart';

class FavoritesController {
  final VoidCallback refreshPage;

  Future<List<Place?>>? favoritePlaces;

  FavoritesController(this.refreshPage) {
    final List<Future<Place?>> favoritesBuffer = [];
    for(String placeId in LoginController.user!.favoritePlaces) {
      favoritesBuffer.add(Database.getPlace(placeId));
    }
    favoritePlaces = Future.wait(favoritesBuffer);
    print('Deu tudo certo ao carregar os favoritos');
    refreshPage();
  }
}

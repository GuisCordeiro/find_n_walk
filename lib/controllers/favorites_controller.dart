import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/database.dart';

class FavoritesController {
  Future<List<Place?>>? favoritePlaces;

  FavoritesController() {
    final List<Future<Place?>> favoritesBuffer = [];
    for(String placeId in LoginController.user!.favoritePlaces) {
      favoritesBuffer.add(Database.getPlace(placeId));
    }
    favoritePlaces = Future.wait(favoritesBuffer);
  }
}

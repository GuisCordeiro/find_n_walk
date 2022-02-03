import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/database.dart';

// Controlador estático da página de favoritos

mixin FavoritesController {

  static Future<List<Place>> get() async {
    final List<Place> result = [];
    for(String placeId in LoginController.user!.favoritePlaces) {
      final place = await Database.getPlace(placeId);
      if (place != null) result.add(place);
    }
    return result;
  }
}

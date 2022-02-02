import 'dart:math';

import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/models/user.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:latlong2/latlong.dart';

class PlacesPageController {
  // Modelo inerente à página:

  User user = LoginController.user!;
  Future<List<Place?>> favoritePlaces;
  Future<List<Place>> nearbyPlaces;

  // TODO Inicializar os lugares próximos é bem mais complicado que inicializar os favoritos, pois envolve utilizar a localização do usuário e o escambau.

  PlacesPageController(
      {required this.user,
      required this.favoritePlaces,
      required this.nearbyPlaces}) {
    List<Future<Place?>> favoritesBuffer = [];
    for (String address in user.favoritePlaces) {
      favoritesBuffer.add(Database.getPlace(address));
    }
    favoritePlaces = Future.wait(favoritesBuffer);
  }

  // Função que calcula a distância entre o usuário e o lugar
  //TODO adicionar o controlador que recebe a localização do lugar

  /*getDistance() async {
    LatLng userLocation = await LoginController.getUserLocation();
    LatLng placeLocation = await PlaceController.getLocation();
    double userX = userLocation.longitude;
    double userY = userLocation.latitude;
    double placeX = placeLocation.longitude;
    double placeY = placeLocation.latitude;
    double distance = sqrt(pow((userX - placeX), 2) + pow((userY - placeY), 2));
    print(distance);
  }*/
}

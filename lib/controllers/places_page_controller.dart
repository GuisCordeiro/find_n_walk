// import 'package:findnwalk/data/models/place.dart';
// import 'package:findnwalk/data/models/user.dart';
// import 'package:findnwalk/data/providers/database.dart';

// class PlacesPageController {
  // Modelo inerente à página:

  // User user;
  // Database source = Database();
  // Future<List<Place>> favoritePlaces;
  // Future<List<Place>> nearbyPlaces;

  // TODO Inicializar os lugares próximos é bem mais complicado que
  // inicializar os favoritos, pois envolve utilizar a localização do
  // usuário e o escambau.

  // PlacesPageController({required this.user}) {
  //   List<Future<Place>> favoritesBuffer = [];
  //   for (String address in user.favoritePlaces) {
  //     favoritesBuffer.add(source.getPlace(address));
  //   }
  //   this.favoritePlaces = Future.wait(favoritesBuffer);
  // }
// }

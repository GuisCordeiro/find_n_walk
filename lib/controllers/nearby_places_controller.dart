import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:flutter/painting.dart';
import 'package:latlong2/latlong.dart';

class NearbyPlacesController {
  final VoidCallback refreshPage;

  final location = LoginController.location!;

  Future<List<Place>>? nearbyPlaces;

  NearbyPlacesController(this.refreshPage) {
    const distance = Distance();
    final allPlaces = Database.getAllPlaces();
    allPlaces.then(
      (snapshot) {
        final List<Place> nearbyBuffer = [];
        for (Place place in snapshot) {
          final km = distance.as(
            LengthUnit.Kilometer,
            location,
            LatLng(
              place.exactLocation.latitude,
              place.exactLocation.longitude,
            ),
          );
          if (km < 50) {
            nearbyBuffer.add(place);
          }
        }
        nearbyPlaces = Future.value(nearbyBuffer);
      },
    ).onError(
      (error, stackTrace) {
        print(error);
        print(stackTrace);
      },
    );
    print('Deu tudo certo ao carregar os lugares próximos');
    refreshPage();
  }
}

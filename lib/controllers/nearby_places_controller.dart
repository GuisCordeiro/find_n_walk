import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:latlong2/latlong.dart';

// Controlador estático da página de locais próximos

mixin NearbyPlacesController {
  static const distance = Distance();

  static Future<List<Place>> get() async {
    final List<Place> result = [];
    final places = await Database.getAllPlaces();
    for (Place place in places) {
      final dist = distance.as(
        LengthUnit.Kilometer,
        LoginController.location!,
        LatLng(
          place.exactLocation.latitude,
          place.exactLocation.longitude,
        ),
      );
      if (dist < 50) result.add(place);
    }
    return result;
  }
}

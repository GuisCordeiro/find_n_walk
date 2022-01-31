import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:latlong2/latlong.dart';

// Controlador estático que gerencia o cadastro de lugares.

mixin CreatePlaceController {
  // Protótipo
  static Future<void> create({
    required String name,
    required String address,
    required String description,
    required String cathegories,
    required String capacity,
    required bool isPublic,
    required LatLng latLng,
  }) async {
    final place = Place(
      creatorId: LoginController.user!.id!,
      name: name,
      address: address,
      exactLocation: GeoPoint(latLng.latitude, latLng.longitude),
      description: description,
      cathegories: cathegories.split(', '),
      capacity: int.parse(capacity),
      isPublic: isPublic,
      rating: 10,
    );
    await Database.addPlace(place);
  }
}

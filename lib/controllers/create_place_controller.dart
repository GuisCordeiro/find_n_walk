import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';

// Controlador que gerencia o cadastro de lugares.

class CreatePlaceController {
  final name = TextEditingController();

  final address = TextEditingController();

  final description = TextEditingController();

  final cathegories = TextEditingController();

  final capacity = TextEditingController();

  bool isPublic = true;

  // Protótipo
  Future<void> create(LatLng exactLocation) async {
    final place = Place(
      creatorId: LoginController.user!.id!,
      name: name.text,
      address: address.text,
      exactLocation: GeoPoint(exactLocation.latitude, exactLocation.longitude),
      description: description.text,
      cathegories: cathegories.text.split(', '),
      isPublic: isPublic,
    );
    await Database.addPlace(place);
  }
}

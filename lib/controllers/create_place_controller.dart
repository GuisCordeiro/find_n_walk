import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:flutter/cupertino.dart';

// Controlador que gerencia o cadastro de lugares.

class CreatePlaceController {
  final name = TextEditingController();

  final address = TextEditingController();

  final description = TextEditingController();

  final cathegory = TextEditingController();

  final capacity = TextEditingController();

  // Protótipo
  Future<void> create() async {
    final place = Place(
      creatorId: LoginController.user!.id!,
      name: name.text,
      address: address.text,
      exactLocation: GeoPoint(LoginController.location!.latitude, LoginController.location!.longitude),
      description: description.text,
      cathegory: [cathegory.text],
      isPublic: true,
    );
    await Database.addPlace(place);
  }
}

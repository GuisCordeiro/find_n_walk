import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:findnwalk/data/models/user.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

enum AuthResult { nameNotFound, wrongPassword, success }

// Controlador estático que gerencia a autenticação e a criação de usuários
class LoginController {
  static User? user;

  static LatLng? location;

  static Future<AuthResult> authenticate(String name, String password) async {
    User? target = await Database.getUser(name);
    if (target == null) {
      return AuthResult.nameNotFound;
    }
    var passwordAsBytes = utf8.encode(password);
    var passwordHash = sha256.convert(passwordAsBytes);
    if (passwordHash == target.passwordHash) {
      user = target;
      return AuthResult.success;
    }
    return AuthResult.wrongPassword;
  }

  static Future<bool> register(User newUser) async {
    bool result = await Database.addUser(newUser);
    if (result == false) return false;
    user = newUser;
    return true;
  }

  static Future<LatLng> getUserLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var lng = position.longitude;
    location = LatLng(lat, lng);
    return location!;
  }
}

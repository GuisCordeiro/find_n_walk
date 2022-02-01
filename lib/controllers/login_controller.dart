import 'dart:convert';
import 'dart:core';

import 'package:crypto/crypto.dart';
import 'package:findnwalk/data/models/user.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

enum AuthResult { userNotFound, wrongPassword, success }

// Controlador estático que gerencia a autenticação e a criação de usuários
mixin LoginController {
  static User? user;

  static LatLng? location;

  static String _hashPassword(String password) {
    final passwordAsBytes = utf8.encode(password);
    final passwordHash = sha256.convert(passwordAsBytes);
    return passwordHash.toString();
  }

  //TODO quando não encontra o email, o app trava
  static Future<AuthResult> authenticate(
      String nameOrEmail, String password) async {
    // If what the user provided to identify themselves fits
    // an email pattern, treat as an email. Otherwise, treat it
    // as a user name.
    User? target;
    final emailPattern = RegExp(r'\w+@\w+\.\w+');
    if (emailPattern.hasMatch(nameOrEmail)) {
      target = await Database.getUserBy('email', nameOrEmail);
    } else {
      target = await Database.getUserBy('name', nameOrEmail);
    }
    if (target == null) {
      return AuthResult.userNotFound;
    }
    // Compare password hashes
    final passwordHash = _hashPassword(password);
    if (passwordHash == target.passwordHash) {
      user = target;
      return AuthResult.success;
    }
    return AuthResult.wrongPassword;
  }

  static Future<void> register(
      String name, String email, String birthday, String password) async {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final newUser = User(
      name: name,
      email: email,
      birthday: dateFormat.parse(birthday),
      passwordHash: _hashPassword(password),
    );
    await Database.addUser(newUser);
    user = newUser;
  }

  static Future<LatLng> getUserLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final lat = position.latitude;
    final lng = position.longitude;
    location = LatLng(lat, lng);
    return location!;
  }
}

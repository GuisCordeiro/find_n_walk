import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/place.dart';
import '../models/user.dart';

mixin Database {
  static final _source = FirebaseFirestore.instance;

  static final _users = _source.collection('users');
  static final _places = _source.collection('places');

  // Operações sobre os usuários.

  static Future<User?> getUser(String name) async {
    var dados = await _users.doc(name).get();
    var data = dados.data();
    if (data != null) {
      return User.fromMap(dados.data() as Map<String, String>);
    }
    return null;
  }

  static Future<bool> addUser(User user) async {
    _users.doc(user.name).set(user.toMap());
    return true;
  }

  static Future<bool> updateUser(User updated) async {
    _users.doc(updated.name).set(updated.toMap());
    return true;
  }

  // Operações sobre os lugares.

  static Future<Place> getPlace(String name) async {
    var dados = await _places.doc(name).get();
    return Place.fromMap(dados.data() as Map<String, dynamic>);
  }

  static Future<void> addPlace(Place place) async {
    _places.doc(place.name).set(place.toMap());
  }

  static Future<void> updatePlace(Place updated) async {
    _places.doc(updated.name).set(updated.toMap());
  }

  // TODO operações sobre as avaliações. O armazenamento
  // delas é ligeiramente mais complexo que o de usuários
  // e lugares, pois envolve subcoleções e gerência de redundância.
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/place.dart';
import '../models/user.dart';

mixin Database {
  static final _source = FirebaseFirestore.instance;

  static final _users = _source.collection('users').withConverter<User>(
        fromFirestore: (snapshots, _) => User.fromJson(snapshots.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  static final _places = _source.collection('places').withConverter<Place>(
        fromFirestore: (snapshots, _) => Place.fromJson(snapshots.data()!),
        toFirestore: (place, _) => place.toJson(),
      );

  // Operações sobre os usuários.

  static Future<User?> getUser(String id) async {
    final dados = await _users.doc(id).get();
    if (!dados.exists) return null;
    final user = dados.data();
    if (user == null) return null;
    user.id = dados.id;
    return user;
  }

  static Future<User?> getUserBy(String property, String value) async {
    final dados = await _users.where(property, isEqualTo: value).get();
    final userDoc = dados.docs.first;
    if (!userDoc.exists) return null;
    final user = userDoc.data();
    user.id = userDoc.id;
    return user;
  }

  // TODO deal with potential errors
  static Future<void> addUser(User user) async {
    final dados = await _users.add(user);
    user.id = dados.id;
  }

  // TODO deal with potential errors
  static Future<void> updateUser(String id, Map<String, dynamic> data) async {
    await _users.doc(id).update(data);
  }

  // Operações sobre os lugares.

  static Future<Place?> getPlace(String id) async {
    final dados = await _places.doc(id).get();
    if (!dados.exists) return null;
    final place = dados.data();
    if (place == null) return null;
    place.id = dados.id;
    return place;
  }

  static Future<Place?> getPlaceBy(String property, String value) async {
    final dados = await _places.where(property, isEqualTo: value).get();
    final placeDoc = dados.docs.first;
    if (!placeDoc.exists) return null;
    final place = placeDoc.data();
    place.id = placeDoc.id;
    return place;
  }

  // NOTE utilizar esse método não é exatamente ótimo
  static Future<Iterable<Place>> getAllPlaces() async {
    final allPlaces = [];
    final placesSnapshot = await _places.get();
    for (QueryDocumentSnapshot<Place?> snapshot in placesSnapshot.docs) {
      if (snapshot.data() != null) {
        allPlaces.add(snapshot.data());
      }
    }
    return (allPlaces).map((item) => item as Place).toList();
  }

  // TODO deal with potential errors
  static Future<void> addPlace(Place place) async {
    final dados = await _places.add(place);
    place.id = dados.id;
  }

  // TODO deal with potential errors
  static Future<void> updatePlace(String id, Map<String, dynamic> data) async {
    await _places.doc(id).update(data);
  }
}

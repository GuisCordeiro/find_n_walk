import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/place.dart';
import '../models/user.dart';
import '../models/review.dart';

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

  // TODO deal with potential errors
  static Future<void> addPlace(Place place) async {
    final dados = await _places.add(place);
    place.id = dados.id;
  }

  // TODO deal with potential errors
  static Future<void> updatePlace(String id, Map<String, dynamic> data) async {
    await _places.doc(id).update(data);
  }

  // Operações sobre as avaliações

  // As avaliações associadas a um dado lugar são armazenadas como
  // uma subcoleção desse lugar. Essa função utilitária retorna
  // referência à coleção de avaliações associada a um lugar de
  // certo id.

  static CollectionReference _reviews(String placeId) {
    return _places.doc(placeId).collection('reviews').withConverter<Review>(
          fromFirestore: (snapshots, _) => Review.fromJson(snapshots.data()!),
          toFirestore: (review, _) => review.toJson(),
        );
  }

  // TODO improve this
  static Future<Iterable<Review?>> getReviews(String placeId) async {
    final snapshot = await _reviews(placeId).get();
    return snapshot.docs.map((doc) => doc.data() as Review?);
  }

  // TODO deal with potential errors
  static Future<void> addReview(String placeId, Review review) async {
    await _reviews(placeId).doc(review.userId).set(review);
  }

  // TODO deal with potential errors
  static Future<void> updateReview(
      String placeId, String reviewId, Map<String, dynamic> data) async {
    await _reviews(placeId).doc(reviewId).update(data);
  }
}

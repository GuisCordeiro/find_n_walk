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

  // TODO tornar os lugares identificados pelo id

  static Future<Place?> getPlace(String name) async {
    final dados = await _places.doc(name).get();
    if (!dados.exists) return null;
    return dados.data();
  }

  // TODO deal with potential errors
  static Future<void> addPlace(Place place) async {
    await _places.doc(place.name).set(place);
  }

  // TODO deal with potential errors
  static Future<void> updatePlace(
      String name, Map<String, dynamic> data) async {
    await _places.doc(name).update(data);
  }

  // Ok, acredito que descobri como nós vamos armazenar as avaliações.
  // As avaliações associadas a um certo lugar serão armazenadas como uma
  // subcoleção desse lugar. Certo? ;)

  static CollectionReference _reviewCollection(Place place) {
    return _places.doc(place.name).collection('reviews').withConverter<Review>(
          fromFirestore: (snapshots, _) => Review.fromJson(snapshots.data()!),
          toFirestore: (review, _) => review.toJson(),
        );
  }

  // TODO improve this
  static Future<Iterable<Review?>> getReviews(Place place) async {
    final snapshot = await _reviewCollection(place).get();
    return snapshot.docs.map((doc) => doc.data() as Review?);
  }

  // TODO deal with potential errors
  static Future<void> addReview(Place place, Review review) async {
    await _reviewCollection(place).doc(review.userId).set(review);
  }

  // TODO deal with potential errors
  static Future<void> updateReview(
      Place place, String reviewId, Map<String, dynamic> data) async {
    await _reviewCollection(place).doc(reviewId).update(data);
  }
}

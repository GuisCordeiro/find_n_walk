// Classe de intereção com o BD.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findnwalk/data/models/user.dart';
import 'package:findnwalk/data/models/place.dart';

class Database {
  get _source => FirebaseFirestore.instance;

  CollectionReference get _users => _source.collection('users');
  CollectionReference get _places => _source.collection('places');

  // Operações sobre os usuários.
  // A chave primária para a coleção users é o e-mail.

  // NOTE Posteriormente, nós podemos mudar isso para um id numérico.
  // Isso introduziria um cado bom de complexidade, mas também
  // permitiria que os usuários mudassem o e-mail associado a
  // conta a qualquer momento, o que seria bem bacana.

  Future<User> getUser(String email) async {
    var dados = await _users.doc(email).get();
    return User.fromMap(dados.data() as Map<String, String>);
  }

  Future<void> addUser(User user) async {
    _users.doc(user.email).set(user.toMap());
  }

  Future<void> updateUser(User updated) async {
    _users.doc(updated.email).set(updated.toMap());
  }

  // Operações sobre os lugares.
  // A chave primária para a coleção places é o endereço.

  // NOTE No momento, o endereço está na forma de string,
  // mas posteriormente, vamos substituí-lo por um tipo geográfico.
  // Quando isso acontecer, teremos que armazenar um geopoint no BD.

  Future<Place> getPlace(String address) async {
    var dados = await _places.doc(address).get();
    return Place.fromMap(dados.data() as Map<String, dynamic>);
  }

  Future<void> addPlace(Place place) async {
    _places.doc(place.address).set(place.toMap());
  }

  Future<void> updatePlace(Place updated) async {
    _places.doc(updated.address).set(updated.toMap());
  }

  // TODO operações sobre as avaliações. O armazenamento
  // delas é ligeiramente mais complexo que o de usuários
  // e lugares, pois envolve subcoleções e gerência de redundância.
}

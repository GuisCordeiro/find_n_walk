// Classe que representa um usuário

import 'package:crypto/crypto.dart';

class User {
  // TODO  falta o campo de foto.

  // Nome de Usuário
  String name;

  // Data de Nascimento
  DateTime birthday;

  // email
  String email;

  // senha
  Digest passwordHash;

  // lugares favoritos
  List<String> favoritePlaces;

  // bio
  String? bio;

  User(
      {required this.name,
      required this.email,
      required this.birthday,
      required this.passwordHash,
      required this.favoritePlaces,
      this.bio});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'user_name': name,
      'birthday': birthday.toString(),
      'password_hash': passwordHash,
      'bio': bio ?? "Hey there! I'm using Find N'Walk",
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      name: map['user_name'],
      birthday: DateTime.parse(map['birthday']),
      passwordHash: map['password_hash'],
      favoritePlaces: map['favorite_places'],
      bio: map['bio'],
    );
  }
}

// Classe que representa um usuário.
// Seu id no banco de dados é gerado automaticamente.

import 'package:crypto/crypto.dart';

class User {
  // id
  String? id;

  // email
  String email;

  // URL da foto
  String? picture;

  // Nome de Usuário
  String name;

  // Data de Nascimento
  DateTime birthday;

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
      this.picture,
      this.bio});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'user_name': name,
      'birthday': birthday.toString(),
      'password_hash': passwordHash,
      'bio': bio ?? "Hey there! I'm using Find N'Walk",
    };
  }

  static User fromJson(Map<String, dynamic> map) {
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

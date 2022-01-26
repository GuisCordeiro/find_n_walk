// Classe que representa um usuário.
// Seu id no banco de dados é gerado automaticamente.

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
  String passwordHash;

  // lugare favoritos
  List<String> favoritePlaces = [];

  // bio
  String? bio;

  User(
      {required this.name,
      required this.email,
      required this.birthday,
      required this.passwordHash,
      this.id,
      this.favoritePlaces = const [],
      this.picture,
      this.bio});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'user_name': name,
      'birthday': birthday.toString(),
      'password_hash': passwordHash,
      'favorite_places': favoritePlaces,
      'bio': bio ?? "Hey there! I'm using Find N'Walk",
    };
  }

  static User fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      name: map['user_name'],
      birthday: DateTime.parse(map['birthday']),
      passwordHash: map['password_hash'],
      favoritePlaces: map['favorite_places'],
      bio: map['bio'],
    );
  }
}

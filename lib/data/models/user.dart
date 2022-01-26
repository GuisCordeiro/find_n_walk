// Classe que representa um usuário

class User {
  //ID do Usuário
  int id;

  // Nome de Usuário
  String userName;

  // Data de Nascimento
  DateTime birthday;

  // email
  String email;

  // senha
  String passwordHash;

  // bio
  String? bio;

  User(
      {required this.id,
      required this.userName,
      required this.email,
      required this.birthday,
      required this.passwordHash,
      this.bio});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'user_name': userName,
      'birthday': birthday.toString(),
      'password_hash': passwordHash,
      'bio': bio ?? "Hey there! I'm using Find N'Walk",
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      userName: map['user_name'],
      birthday: DateTime.parse(map['birthday']),
      passwordHash: map['password_hash'],
      bio: map['bio'],
    );
  }
}

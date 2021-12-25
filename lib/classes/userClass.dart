//Classe que representa os usuários

class User {
  //Id do usuário
  int id;

  //Nome de Usuário
  String userName;

  //Data de Nascimento
  DateTime birthday;

  //email
  String email;

  //senha
  String password;

  //lista de ids de lugares favoritos
  List<int?> favorites;

  //bio
  String? bio;

  User(this.id, this.userName, this.birthday, this.email, this.password, this.favorites);
}

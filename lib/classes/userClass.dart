//Classe que representa os usuários

import 'package:flutter/material.dart';

class User {
  //Nome de Usuário
  String userName;

  //Data de Nascimento
  DateTime birthday;

  //email
  String email;

  //senha
  String password;

  //bio
  String? bio;

  User(this.userName, this.birthday, this.email, this.password);
}

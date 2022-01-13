import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:findnwalk/data/models/user.dart';

// Trabalho inicial

enum AuthResult { nameNotFound, wrongPassword, success }

// Controlador que gerencia a autenticação e a criação de usuários
class LoginController {
  User? logged;

  double lat = 0;

  double lng = 0;

  final _source = Database();

  Future<AuthResult> authenticate(String name, String password) async {
    User? target = await _source.getUser(name);
    if (target == null) {
      return AuthResult.nameNotFound;
    }
    var passwordAsBytes = utf8.encode(password);
    var passwordHash = sha256.convert(passwordAsBytes);
    if (passwordHash == target.passwordHash) {
      logged = target;
      return AuthResult.success;
    }
    return AuthResult.wrongPassword;
  }

  Future<bool> register(User user) async {
    bool result = await _source.addUser(user);
    return result;
  }
}

import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/form.dart';
import 'package:findnwalk/components/shared/app_button.dart';
import 'package:flutter/material.dart';

import '../login/login_page.dart';

/*
  Página de Cadastro
*/

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool agreed = false;

  final _nameFieldController = TextEditingController();

  final _birthdayFieldController = TextEditingController();

  final _emailFieldController = TextEditingController();

  final _passwordFieldController = TextEditingController();

  final _passwordAgainFieldController = TextEditingController();

  @override
  void dispose() {
    _nameFieldController.dispose();
    _birthdayFieldController.dispose();
    _emailFieldController.dispose();
    _passwordFieldController.dispose();
    _passwordAgainFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const Text(
          'Cadastro',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            AppForm(
              label: 'Nome do usuário',
              icon: const Icon(Icons.people),
              decision: false,
              controller: _nameFieldController,
            ),
            AppForm(
              label: 'Data de nascimento',
              icon: const Icon(Icons.date_range),
              decision: false,
              controller: _birthdayFieldController,
            ),
            AppForm(
              label: 'E-mail',
              icon: const Icon(Icons.email),
              decision: false,
              controller: _emailFieldController,
            ),
            AppForm(
              label: 'Senha',
              icon: const Icon(Icons.lock_open),
              decision: false,
              controller: _passwordFieldController,
            ),
            AppForm(
              label: 'Confirme sua senha',
              icon: const Icon(Icons.lock),
              decision: false,
              controller: _passwordAgainFieldController,
            ),
            CheckboxListTile(
              title: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                  text: 'Li e concordo com os',
                  style: TextStyle(fontSize: 15, color: AppColors.grey),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' termos de uso',
                      style: TextStyle(color: AppColors.blue),
                    ),
                  ],
                ),
              ),
              activeColor: AppColors.orange,
              checkColor: AppColors.white,
              controlAffinity: ListTileControlAffinity.leading,
              value: agreed,
              onChanged: (bool? value) {
                setState(
                  () {
                    agreed = value ?? false;
                  },
                );
              },
            ),
            AppButton(
              label: 'Cadastrar-se',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

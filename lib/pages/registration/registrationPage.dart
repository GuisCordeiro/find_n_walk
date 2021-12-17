import 'package:findnwalk/components/shared/orangeButton.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/form.dart';
import 'package:findnwalk/pages/login/loginPage.dart';
import 'package:flutter/material.dart';

/*
  Página de Cadastro
*/

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({ Key? key }) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool selecionado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: Text(
          'Cadastro',
          style: TextStyle(
            color: AppColors.black
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            AppForm('Nome do usuário', Icon(Icons.people), false),
            AppForm('Data de nascimento', Icon(Icons.date_range), false),
            AppForm('E-mail', Icon(Icons.email), false),
            AppForm('Senha', Icon(Icons.lock_open), false),
            AppForm('Confirme sua senha', Icon(Icons.lock), false),
              CheckboxListTile(
                title: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Li e concordo com os',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.grey
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: ' termos de uso',
                          style: TextStyle(
                            color: AppColors.blue
                          ),
                          
                        ),
                      ]
                    ),
                  ),
                activeColor: AppColors.orange,
                checkColor: AppColors.white,
                controlAffinity: ListTileControlAffinity.leading,
                value: selecionado,
                onChanged: (bool? value){
                  setState(() {
                    selecionado = value!;
                  });
                },
            ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    )
                  );
                },
                child: Botao(
                  'Cadastrar-se'
                )
              )
          ]
        ),
      ),
    );
  }
}
import 'package:findnwalk/components/orangeButton.dart';
import 'package:findnwalk/components/colors.dart';
import 'package:findnwalk/components/form.dart';
import 'package:findnwalk/pages/loginPage.dart';
import 'package:flutter/material.dart';

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
        title: Text('Cadastro'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Formulario('Nome do usuário'),
              Formulario('Data de nascimento'),
              Formulario('E-mail'),
              Formulario('Senha'),
              Formulario('Confirme sua senha'),
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
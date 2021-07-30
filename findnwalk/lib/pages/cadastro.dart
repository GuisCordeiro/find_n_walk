import 'package:findnwalk/components/botao.dart';
import 'package:findnwalk/components/colors.dart';
import 'package:findnwalk/components/formulario.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({ Key? key }) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        color: Cores.cinza
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: ' termos de uso',
                          style: TextStyle(
                            color: Cores.azul
                          ),
                          
                        ),
                      ]
                    ),
                  ),
                activeColor: Cores.laranja,
                checkColor: Cores.branco,
                controlAffinity: ListTileControlAffinity.leading,
                value: selecionado,
                onChanged: (bool? value){
                  setState(() {
                    selecionado = value!;
                  });
                },
              ),
              Botao('Cadastrar-se')
            ],
            
            )
          ]
        ),
      ),
    );
  }
}
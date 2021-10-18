import 'package:findnwalk/components/colors.dart';
import 'package:findnwalk/components/form.dart';
import 'package:findnwalk/components/orangeButton.dart';
import 'package:flutter/material.dart';

class CreatePlace extends StatefulWidget {
  const CreatePlace({ Key? key }) : super(key: key);

  @override
  _CreatePlaceState createState() => _CreatePlaceState();
}

class _CreatePlaceState extends State<CreatePlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            padding: EdgeInsets.only(right: 10, left: 10,bottom: 10, top: 20),
            color: AppColors.white,
            child: ListView(
              children:[ 
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Cadastrar ',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 25,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Evento',
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 25,
                        )
                      )
                    ]
                  ),
                ),
                AppForm('Nome do evento'),
                AppForm('Horário'),
                AppForm('Duração'),
                AppForm('Local'),
                AppForm('Bairro'),
                AppForm('Número de participantes'),
                AppForm('Descrição'),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: (){},
                    child: Botao(
                      'Procurar lugar no mapa'
                    )
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context,).pop(),
                  child: Botao(
                    'Fechar'
                  )
                ),
              ]
            ),
            
          ),
        );
  }
}
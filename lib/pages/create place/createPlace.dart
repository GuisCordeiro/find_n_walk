import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/form.dart';
import 'package:findnwalk/components/shared/orangeButton.dart';
import 'package:flutter/material.dart';

class CreatePlace extends StatefulWidget {
  const CreatePlace({Key? key}) : super(key: key);

  @override
  _CreatePlaceState createState() => _CreatePlaceState();
}

class _CreatePlaceState extends State<CreatePlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 20),
        color: AppColors.white,
        child: ListView(
          children: [
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
                    text: 'Local',
                    style: TextStyle(
                      color: AppColors.orange,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            AppForm('Nome do evento', Icon(Icons.event), false),
            AppForm('Horário', Icon(Icons.hourglass_bottom), false),
            AppForm('Duração', Icon(Icons.timer), false),
            AppForm('Endereço', Icon(Icons.place), false),
            AppForm('Número de participantes', Icon(Icons.people), false),
            AppForm('Descrição', Icon(Icons.view_list), false),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () {},
                child: Botao('Marcar local no mapa'),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(
                context,
              ).pop(),
              child: Botao('Fechar'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/form.dart';
import 'package:findnwalk/components/shared/orange_button.dart';
import 'package:findnwalk/components/shared/switch_form.dart';
import 'package:findnwalk/controllers/create_place.dart';
import 'package:findnwalk/pages/create_place/choose_place.dart';
import 'package:flutter/material.dart';

class CreatePlace extends StatefulWidget {
  const CreatePlace({Key? key}) : super(key: key);

  @override
  _CreatePlaceState createState() => _CreatePlaceState();
}

class _CreatePlaceState extends State<CreatePlace> {
  PlaceController createPlace = PlaceController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 20),
        color: AppColors.white,
        child: ListView(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Cadastrar ',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 25,
                ),
                children: <TextSpan>[
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
            AppForm('Nome do local', const Icon(Icons.info), false,
                createPlace.local),
            AppForm('Endereço', const Icon(Icons.place), false,
                createPlace.address),
            AppForm('Descrição', const Icon(Icons.view_list), false,
                createPlace.description),
            //TODO inserir o controlador que crie uma lista de categorias a partir da string
            //local está inserido por falta de outro controlador
            AppForm('Categorias', const Icon(Icons.sports_soccer), false,
                createPlace.local),
            //TODO inserir o controlador que receba um bool para determinar se o local é público ou não
            //local está inserido por falta de outro controlador
            AppSwitchForm(
                label: 'É público?', formController: createPlace.local),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () {
                  if (createPlace.local.text == '' ||
                      createPlace.address.text == '' ||
                      createPlace.description.text == '') {
                    const AlertDialog(
                      title: Text("Preencha todos os campos!"),
                    );
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChoosePlace(
                              createPlace.local.text,
                              createPlace.address.text,
                              createPlace.description.text),
                        ));
                  }
                },
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

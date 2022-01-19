import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/form.dart';
import 'package:findnwalk/components/shared/orange_button.dart';
import 'package:findnwalk/controllers/create_place_controller.dart';
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
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
          bottom: 10,
          top: 20,
        ),
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
            AppForm(
                label: 'Nome do local',
                icon: const Icon(Icons.event),
                decision: false,
                controller: createPlace.local),
            AppForm(
                label: 'Endereço',
                icon: const Icon(Icons.place),
                decision: false,
                controller: createPlace.address),
            AppForm(
                label: 'Descrição',
                icon: const Icon(Icons.view_list),
                decision: false,
                controller: createPlace.description),
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
                      ),
                    );
                  }
                },
                child: const Botao('Marcar local no mapa'),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(
                context,
              ).pop(),
              child: const Botao('Fechar'),
            ),
          ],
        ),
      ),
    );
  }
}

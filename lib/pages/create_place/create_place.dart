import 'package:findnwalk/components/create_place/picture_button.dart';
import 'package:findnwalk/components/shared/app_button.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/custom_select_form_field.dart';
import 'package:findnwalk/components/shared/form.dart';
import 'package:findnwalk/pages/create_place/choose_place.dart';
import 'package:flutter/material.dart';

class CreatePlace extends StatefulWidget {
  final VoidCallback refreshMap;
  const CreatePlace(this.refreshMap, {Key? key}) : super(key: key);

  @override
  _CreatePlaceState createState() => _CreatePlaceState();
}

class _CreatePlaceState extends State<CreatePlace> {
  final name = TextEditingController();

  final address = TextEditingController();

  final description = TextEditingController();

  final cathegories = TextEditingController();

  final capacity = TextEditingController();

  final pictureButton = PictureButton();

  bool isPublic = true;

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    description.dispose();
    cathegories.dispose();
    capacity.dispose();
    super.dispose();
  }

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
          children: <Widget>[
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
              controller: name,
            ),
            AppForm(
              label: 'Endereço',
              icon: const Icon(Icons.place),
              decision: false,
              controller: address,
            ),
            AppForm(
              label: 'Categorias',
              icon: const Icon(Icons.sports_soccer),
              decision: false,
              controller: cathegories,
            ),
            AppForm(
              label: 'Descrição',
              icon: const Icon(Icons.view_list),
              decision: false,
              controller: description,
            ),
            CustomSelectFormField(
              label: 'Capacidade de Pessoas',
              icon: const Icon(Icons.person),
              controller: capacity,
            ),
            pictureButton, // botão simples para seleção de imagens
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SwitchListTile(
                value: isPublic,
                title: const Text('É público?'),
                onChanged: (bool state) {
                  setState(
                    () {
                      isPublic = state;
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: AppButton(
                label: 'Marcar local no mapa',
                onTap: () {
                  if (name.text == '' ||
                      address.text == '' ||
                      cathegories.text == '' ||
                      capacity.text == '' ||
                      // !pictureButton.usedOnce ||
                      description.text == '') {
                    const AlertDialog(
                      title: Text("Preencha todos os campos!"),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChoosePlace(
                          refreshMap: widget.refreshMap,
                          name: name.text,
                          address: address.text,
                          capacity: capacity.text,
                          description: description.text,
                          cathegories: cathegories.text,
                          isPublic: isPublic,
                          // Lidar com as fotos...
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            AppButton(
              label: 'Fechar',
              onTap: () {
                Navigator.of(
                  context,
                ).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

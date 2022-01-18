import 'package:flutter/material.dart';

/*
  Esse é o campo de preenchimento dos formulários, você só precisa passar a string
  que ficará dentro do campo de preenchimeto (o placeholder).
  A chamada desse componente é: Formulário('string')
*/

class AppSwitchForm extends StatefulWidget {
  final String label;
  final TextEditingController formController;
  const AppSwitchForm(
      {Key? key, required this.label, required this.formController})
      : super(key: key);

  @override
  _AppSwitchFormState createState() => _AppSwitchFormState();
}

class _AppSwitchFormState extends State<AppSwitchForm> {
  bool value = false;

  void dispose() {
    widget.formController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.label,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 10),
            Switch.adaptive(
                inactiveThumbColor: Colors.red,
                activeColor: Colors.green,
                value: value,
                //TODO adicionar controlador do switch
                onChanged: (value) => setState(() => this.value = value)),
          ],
        ));
  }
}

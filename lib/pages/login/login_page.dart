import 'package:findnwalk/components/shared/checkbox.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/form.dart';
import 'package:findnwalk/components/shared/orange_button.dart';
import 'package:findnwalk/controllers/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../registration/registration_page.dart';

/*
  Página de login
*/

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    lowerBound: 0.5,
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticInOut,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool selecionado = false;

  Color getColor(Set<MaterialState> estados) {
    const Set<MaterialState> mudaEstado = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (estados.any(mudaEstado.contains)) {
      return AppColors.grey;
    }
    return AppColors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Column(children: [
                    ScaleTransition(
                      scale: _animation,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            child: Image.asset(
                              'assets/images/logoWithOutBG.png',
                              scale: MediaQuery.of(context).size.height / 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: 'Find',
                          style:
                              TextStyle(fontSize: 25, color: Color(0xff3f3f3f)),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'N',
                                style: TextStyle(color: AppColors.orange)),
                            TextSpan(
                                text: 'Walk',
                                style: TextStyle(color: Color(0xff3f3f3f)))
                          ]),
                    ),
                    AppForm('Digite seu email', const Icon(Icons.email), false,
                        TextEditingController()),
                    AppForm('Digite sua senha', const Icon(Icons.lock), true,
                        TextEditingController()),
                    const CheckboxLaranja('lembre-se de mim'),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomFNBar(),
                              ));
                        },
                        child: const Botao('Enviar')),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationPage(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: 'Não tem cadastro?',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.grey),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Cadastre-se',
                                    style: TextStyle(color: AppColors.blue)),
                              ]),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

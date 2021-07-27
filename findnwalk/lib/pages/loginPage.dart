import 'package:findnwalk/components/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{
  
  late final AnimationController _controller = AnimationController(
    lowerBound: 0.5,
    duration: const Duration( seconds: 2 ),
    vsync: this,
  )..repeat(reverse: true);
  
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticInOut,
  );
  

  @override
  void dispose(){
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
      return Cores.cinza;
    }
    return Cores.laranja;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          children:[

            ScaleTransition(
              scale: _animation,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: SizedBox(
                    child: Image.asset(
                      'lib/assets/images/Logo_FindNWalk_SemFundo.png',
                      scale: MediaQuery.of(context).size.height/100,
                    ),
                  ),
                ),
              ),
            ), 
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Find',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff3f3f3f)
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'N',
                    style: TextStyle(
                      color: Cores.laranja
                    )
                  ),
                  TextSpan(
                    text: 'Walk',
                    style: TextStyle(
                      color: Color(0xff3f3f3f)
                    )
                  )
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                cursorColor: Cores.laranja,
                decoration: InputDecoration(
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Cores.cinza
                  )
                ),
                focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Cores.laranja
                  )
                ),
                hintText: 'Digite seu email',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                cursorColor: Cores.laranja,
                decoration: InputDecoration(
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Cores.cinza
                  )
                ),
                focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Cores.laranja
                  )
                ),
                hintText: 'Digite sua senha',
                ),
              ),
            ),

            CheckboxListTile(
              title: Text(
                'lembre-se de mim',
                style: TextStyle(
                  color: Cores.cinza
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
            InkWell(
              onTap: (){
                
              },
              child: Container(
                width: MediaQuery.of(context).size.width/3,
                height: MediaQuery.of(context).size.height/20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Cores.laranja
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Enviar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Cores.branco
                    ),
                  ),
                ),
              ),
            ),
               
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Não tem cadastro?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Cores.cinza
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' Cadastre-se',
                      style: TextStyle(
                        color: Cores.azul
                      )
                    ),
                  ]
                ),
              ),
            ),
            
          ]
        ),
      );
  }
}
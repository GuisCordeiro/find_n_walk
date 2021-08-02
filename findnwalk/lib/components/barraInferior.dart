import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:findnwalk/components/colors.dart';
import 'package:flutter/material.dart';


/* 
  Barra de navegação inferior(Appbar de baixo :))
*/

class BarraInferior extends StatefulWidget {
  const BarraInferior({ Key? key }) : super(key: key);

  @override
  _BarraInferiorState createState() => _BarraInferiorState();
}

class _BarraInferiorState extends State<BarraInferior> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
    backgroundColor: Cores.transparente,
    color: Cores.laranja,
    items: <Widget>[
      Icon(Icons.list, size: 30, color: Cores.preto,),
      Icon(Icons.place, size: 30, color: Cores.preto,),
      Icon(Icons.add, size: 40, color: Cores.preto,),
      Icon(Icons.history, size: 30, color: Cores.preto,),
      Icon(Icons.person, size: 30, color: Cores.preto,),
    ],
    onTap: (index) {
      setState(() {
        
      });
    },
  );
  }
}
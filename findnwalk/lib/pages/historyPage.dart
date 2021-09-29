import 'package:findnwalk/components/colors.dart';
import 'package:findnwalk/components/tabAppBar.dart';
import 'package:findnwalk/pages/perfilPage.dart';
import 'package:flutter/material.dart';

/*
  Página de histórico de eventos
*/

class HistoryPage extends StatefulWidget {
  const HistoryPage({ Key? key }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}


class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.orange
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: TabFNAppBar('Recentes', Icon(Icons.person),PerfilPage(),false,'Lugares Frequentados','Minhas Avaliações')
          ),
          body: TabBarView(
                children: <Widget>[
                  Text('1'),
                  Text('2'),
                ],
          )
        )
      )
    );
  }
}
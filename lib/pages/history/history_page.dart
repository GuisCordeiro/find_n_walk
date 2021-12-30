import 'package:findnwalk/components/history/reviews_list_view.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/tab_app_bar.dart';
import 'package:flutter/material.dart';

import '../profile/profile_page.dart';

/*
  Página de histórico de eventos
*/

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: AppColors.orange),
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(70),
                    child: TabFNAppBar(
                        'Recentes',
                        Icon(Icons.person),
                        PerfilPage(),
                        false,
                        'Lugares Frequentados',
                        'Minhas Avaliações')),
                body: TabBarView(
                  children: <Widget>[
                    Text('1'),
                    reviewedPlaces(),
                  ],
                ))));
  }
}

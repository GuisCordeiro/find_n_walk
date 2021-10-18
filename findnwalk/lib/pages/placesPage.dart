import 'package:findnwalk/components/colors.dart';
import 'package:findnwalk/components/myEventsListView.dart';
import 'package:findnwalk/components/tabAppBar.dart';
import 'package:findnwalk/components/allEventsListView.dart';
import 'package:findnwalk/pages/perfilPage.dart';
import 'package:flutter/material.dart';

/*
  Página de eventos do aplicativo
*/

class PlacesPage extends StatefulWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: AppColors.orange),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(70),
                  child: TabFNAppBar(
                      'Lugares',
                      Icon(Icons.person),
                      PerfilPage(),
                      false,
                      'Lugares perto de você',
                      'Lugares favoritos'
                  )),
              body: TabBarView(
                children: <Widget>[
                  allEvents(),
                  myEvents(),
                ],
              )),
        ));
  }
}

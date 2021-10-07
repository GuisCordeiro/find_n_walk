import 'package:findnwalk/components/colors.dart';
import 'package:findnwalk/components/myEventsListView.dart';
import 'package:findnwalk/components/tabAppBar.dart';
import 'package:findnwalk/components/allEventsListView.dart';
import 'package:findnwalk/pages/perfilPage.dart';
import 'package:flutter/material.dart';

/*
  Página de eventos do aplicativo
*/

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
                      'Eventos',
                      Icon(Icons.person),
                      PerfilPage(),
                      false,
                      'Eventos Cadastrados',
                      'Meus Eventos')),
              body: TabBarView(
                children: <Widget>[
                  allEvents(),
                  myEvents(),
                ],
              )),
        ));
  }
}

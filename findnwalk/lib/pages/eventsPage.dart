import 'package:findnwalk/components/appBar.dart';
import 'package:findnwalk/pages/perfilPage.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({ Key? key }) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}


class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: FNAppBar('Eventos', Icon(Icons.person), PerfilPage(),false)
      ),
      body: ListView(
        children: [
          Text('Events page')
      ],
      ),
    );
  }
}
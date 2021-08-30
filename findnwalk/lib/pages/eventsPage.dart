import 'package:findnwalk/controller/bottomNavigationBar.dart';
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
      bottomNavigationBar: BottomFNBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Text('Events page')
        ],
        ),
      ),
    );
  }
}
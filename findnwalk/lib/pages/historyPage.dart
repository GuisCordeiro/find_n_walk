import 'package:findnwalk/components/appBar.dart';
import 'package:findnwalk/controller/bottomNavigationBar.dart';
import 'package:findnwalk/pages/perfilPage.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({ Key? key }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}


class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: FNAppBar('Recentes', Icon(Icons.person),PerfilPage(),false)
      ),
      body: ListView(
        children: [
          Text('History page')
      ],
      ),
    );
  }
}
import 'package:findnwalk/components/history/reviews_list_view.dart';
import 'package:findnwalk/components/shared/colors.dart';
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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: const Text(
            'Minhas Avaliações',
            style: TextStyle(color: AppColors.black),
          ),
          actions: [
            IconButton(
              color: AppColors.black,
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PerfilPage(),
                  ),
                );
              },
            )
          ],
        ),
        body: reviewedPlaces(),
      ),
    );
  }
}

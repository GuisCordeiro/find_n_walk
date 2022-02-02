import 'package:findnwalk/components/places_listviews/favorite_places_list_view.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:flutter/material.dart';

import '../profile/profile_page.dart';

/*
  Página de histórico de eventos
*/

class FavoriesPage extends StatefulWidget {
  const FavoriesPage({Key? key}) : super(key: key);

  @override
  _FavoriesPageState createState() => _FavoriesPageState();
}

class _FavoriesPageState extends State<FavoriesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: AppColors.orange),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: const Text(
            'Lugares Favoritos',
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
        body: const FavoritePlaces(),
      ),
    );
  }
}

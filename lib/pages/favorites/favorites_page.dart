import 'package:findnwalk/components/places_listviews/place_tile.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/controllers/favorites_controller.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:flutter/material.dart';

import '../profile/profile_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  FavoritesController? _controller;

  _refresh() => setState(() {});

  @override
  void initState() {
    _controller = FavoritesController(_refresh);
    super.initState();
  }

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
        // body: const FavoritePlaces(),
        body: FutureBuilder<List<Place?>>(
          future: _controller!.favoritePlaces,
          builder:
              (BuildContext context, AsyncSnapshot<List<Place?>> snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final place = snapshot.data![index];
                  if (place != null) {
                    return PlaceTile(place: place);
                  }
                  // HACK eu só tinha que não exibir nada
                  // na possibilidade de um lugar não ser
                  // recuperado do BD.
                  return const ListTile();
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            }
            return ListView();
          },
        ),
      ),
    );
  }
}

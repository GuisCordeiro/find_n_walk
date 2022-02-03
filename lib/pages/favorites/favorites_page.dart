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
  @override
  void initState() {
    super.initState();
  }

  Future<void> _refresh() async {
    setState(() {});
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
          actions: <IconButton>[
            IconButton(
              color: AppColors.black,
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            )
          ],
        ),
        // body: const FavoritePlaces(),
        body: FutureBuilder<List<Place>>(
          initialData: const [],
          future: FavoritesController.get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final place = snapshot.data![index];
                  return PlaceTile(place: place);
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            );
          },
        ),
      ),
    );
  }
}

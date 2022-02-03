import 'package:findnwalk/components/places_listviews/place_tile.dart';
import 'package:findnwalk/controllers/nearby_places_controller.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

//  Página de lugares próximos do aplicativo

class NearbyPlaces extends StatefulWidget {
  const NearbyPlaces({Key? key}) : super(key: key);

  @override
  _NearbyPlacesState createState() => _NearbyPlacesState();
}

class _NearbyPlacesState extends State<NearbyPlaces> {

  NearbyPlacesController? _controller;

  _refresh() => setState(() {});

  @override
  void initState() {
    _controller = NearbyPlacesController(_refresh);
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
            'Lugares Próximos',
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
        body: FutureBuilder(
          future: _controller!.nearbyPlaces,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final place = snapshot.data![index];
                  return PlaceTile(place: place);
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

import 'package:findnwalk/components/places_listviews/all_places_list_view.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

/*
  Página de lugares do aplicativo
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
        body: const AllPlaces(),
      ),
    );
  }
}

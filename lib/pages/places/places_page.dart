import 'package:findnwalk/components/places/all_places_list_view.dart';
import 'package:findnwalk/components/places/favorite_places_list_view.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/shared/tab_app_bar.dart';
import 'package:flutter/material.dart';

import '../profile/profile_page.dart';

/*
  Página de eventos do aplicativo
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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: TabFNAppBar('Lugares', Icon(Icons.person), PerfilPage(),
                false, 'Lugares perto de você', 'Lugares favoritos'),
          ),
          body: TabBarView(
            children: <Widget>[
              allPlaces(),
              FavoritePlaces(),
            ],
          ),
        ),
      ),
    );
  }
}

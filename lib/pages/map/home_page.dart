import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:findnwalk/components/map/map_app.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:flutter/material.dart';

import '../create_place/create_place.dart';

/*
  Página principal
*/

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    refreshMap(){
    setState(() {
      
    });
  }

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePlace(refreshMap),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: AppColors.black,
        ),
        backgroundColor: AppColors.orange,
      ),
      body: SafeArea(
        child: FutureBuilder(
          // TODO improve this
          future: LoginController.getUserLocation(),
          builder: (context, snapshot) {
            if (LoginController.location!.latitude != 0) {
              return Stack(
                children: const [
                  MapApp(),
                ],
              );
            } else {
              return const Center(
                child: Text(
                  'Não foi possível carregar o mapa :(',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

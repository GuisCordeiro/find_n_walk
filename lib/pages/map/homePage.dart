import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:findnwalk/pages/create%20place/createPlace.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/components/map/mapApp.dart';
import 'package:findnwalk/controller/variables.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/*
  Página principal
*/

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (lat == 0 || lng == 0) {
      setState(() {
        lat = position.latitude;
        lng = position.longitude;
      });
    }
    print("latitude: $lat,longitude: $lng");
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
              builder: (context) => CreatePlace(),
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
          future: _getCurrentLocation(),
          builder: (context, snapshot) {
            if (lat != 0) {
              return Stack(
                children: [
                  MapApp(),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: AnimSearchBar(
                      helpText: 'Pesquisar...',
                      width: MediaQuery.of(context).size.width,
                      textController: textController,
                      onSuffixTap: () {
                        setState(
                          () {
                            textController.clear();
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(
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

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:findnwalk/components/addButton.dart';
import 'package:findnwalk/components/colors.dart';
import 'package:findnwalk/components/mapApp.dart';
import 'package:findnwalk/controller/variables.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/*
  Página principal
*/

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  _getCurrentLocation()async{
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if(lat == 0 || lng == 0){
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
      floatingActionButton: AddButton(),
      body: SafeArea(
        child: FutureBuilder(
          future:_getCurrentLocation(),
          builder: (context, snapshot){
            if (lat != 0) {
              return Stack(
                children: [
                  MapApp(),
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: AnimSearchBar(
                      helpText: 'Pesquisar...',
                      width: MediaQuery.of(context).size.width,
                      textController: textController,
                      onSuffixTap: (){
                        setState(() {
                          textController.clear();
                        });
                      },
                    ),
                  ),
                ],
              );
            } else{
              return Center(
                child: Text(
                  'Não conseguimos carregar o mapa :(',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                  ),
                )
              );
            }
          }
        ),
      ),
    );
  }
}
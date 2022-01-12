import 'package:findnwalk/components/markers/marker_place.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/controllers/variables.dart';
import 'package:findnwalk/pages/map/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ChoosePlace extends StatefulWidget {
  final String placeName;
  final String placeAddress;
  final String placeDescription;
  const ChoosePlace(this.placeName, this.placeAddress, this.placeDescription);
  @override
  _ChoosePlaceState createState() => _ChoosePlaceState(placeName, placeAddress, placeDescription);
}

class _ChoosePlaceState extends State<ChoosePlace> {
  final String placeName;
  final String placeAddress;
  final String placeDescription;
  _ChoosePlaceState(this.placeName, this.placeAddress, this.placeDescription);
  List<Marker> placesMarker = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: Text(
          "Escolha o local",
          style: TextStyle(
            color: AppColors.black
          ),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          onLongPress: (tappedPoint, LatLng) {
            _handleTap;
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
          },
          center: LatLng(lat, lng),
          zoom: 16.0,
          maxZoom: 18,
          minZoom: 5,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: placesMarker
          ),
          
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 130.0,
                height: 130.0,
                point: LatLng(lat, lng),
                builder: (ctx) => GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                      context: context, 
                      builder: (builder){
                        return Container(
                          height: MediaQuery.of(context).size.height/3,
                          color: AppColors.white,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    color: AppColors.orange,
                                    height: MediaQuery.of(context).size.height/12,
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "Nome do Local",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white,
                                              fontSize: 26
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Endereço",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Descrição",
                                    style: TextStyle(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    child: Image.asset('assets/images/cursor.png'),
                  ),
                ),
              ),
              
            ],
          ),
        ],
        
      ),
    );
  }
   _handleTap(LatLng tappedPoint){
    setState(() {
      placesMarker.add(
        createmarker(tappedPoint, context, placeName, placeAddress, placeDescription)
      );      
    });
  }
}
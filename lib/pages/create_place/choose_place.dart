import 'package:findnwalk/components/markers/marker_place.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/controller/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ChoosePlace extends StatefulWidget {
  const ChoosePlace({ Key? key }) : super(key: key);

  @override
  _ChoosePlaceState createState() => _ChoosePlaceState();
}

class _ChoosePlaceState extends State<ChoosePlace> {
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
          onTap: _handleTap,
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
  void _handleTap(LatLng tappedPoint){
    setState(() {
      placesMarker = [];
      placesMarker.add(
        createmarker(tappedPoint, context, placeName, placeAdress, placeDescription)
      );      
    });
  }
}
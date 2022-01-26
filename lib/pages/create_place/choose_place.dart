import 'package:findnwalk/components/markers/marker_place.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/pages/map/home_page.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:findnwalk/controllers/temp.dart';

import '../map/home_page.dart';

class ChoosePlace extends StatefulWidget {
  final String placeName;

  final String placeAddress;

  final String placeDescription;

  const ChoosePlace(this.placeName, this.placeAddress, this.placeDescription,
      {Key? key})
      : super(key: key);

  @override
  _ChoosePlaceState createState() =>
      _ChoosePlaceState(placeName, placeAddress, placeDescription);
}

class _ChoosePlaceState extends State<ChoosePlace> {
  final String placeName;
  final String placeAddress;
  final String placeDescription;
  _ChoosePlaceState(this.placeName, this.placeAddress, this.placeDescription);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const Text(
          "Escolha o local",
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          onLongPress: (tappedPoint, LatLng thing) {
            _handleTap;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ).then(
              (value) => setState(() {}),
            );
          },
          center: LoginController.location,
          zoom: 16.0,
          maxZoom: 18,
          minZoom: 5,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(markers: ListPlaceMarkers.placesMarker),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 130.0,
                height: 130.0,
                // TODO make this better
                point: LoginController.location ?? LatLng(0, 0),
                builder: (ctx) => GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 3,
                          color: AppColors.white,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    color: AppColors.orange,
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                  ),
                                  Column(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Nome do Local",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.white,
                                                fontSize: 26),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Endereço",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
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
                  child: Image.asset('assets/images/cursor.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    setState(
      () {
        ListPlaceMarkers.placesMarker.add(createmarker(
            tappedPoint, context, placeName, placeAddress, placeDescription));
      },
    );
  }
}

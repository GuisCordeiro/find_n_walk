import 'package:findnwalk/components/markers/marker_place.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/controllers/create_place_controller.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/controllers/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../map/home_page.dart';

// Página que permite ao usuário precisar a localização do lugar sendo
// cadastrado. É carregada logo após o envio das informações esperadas
// pela página de cadastro.

class ChoosePlace extends StatefulWidget {
  final String name;

  final String address;

  final String description;

  final String cathegories;

  final String capacity;

  final bool isPublic;

  const ChoosePlace(
      {required this.name,
      required this.address,
      required this.description,
      required this.cathegories,
      required this.capacity,
      required this.isPublic,
      Key? key})
      : super(key: key);

  @override
  _ChoosePlaceState createState() => _ChoosePlaceState(isPublic);
}

class _ChoosePlaceState extends State<ChoosePlace> {
  bool isPublic;

  _ChoosePlaceState(this.isPublic);

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
            _handleTap(thing);
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
        layers: <LayerOptions>[
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(markers: ListPlaceMarkers.placesMarker),
          MarkerLayerOptions(
            markers: <Marker>[
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
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    color: AppColors.orange,
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                  ),
                                  Column(
                                    children: const <Widget>[
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
                                              fontSize: 26,
                                            ),
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
                                  ),
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

  Future<void> _handleTap(LatLng tappedPoint) async {
    await CreatePlaceController.create(
      latLng: tappedPoint,
      name: widget.name,
      address: widget.address,
      capacity: widget.capacity,
      description: widget.description,
      cathegories: widget.cathegories,
      isPublic: isPublic,
    );
    setState(
      () {
        ListPlaceMarkers.placesMarker.add(
          createmarker(
            tappedPoint,
            context,
            widget.name,
            widget.address,
            widget.description,
          ),
        );
      },
    );
  }
}

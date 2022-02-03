import 'package:findnwalk/components/markers/marker_place.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/controllers/create_place_controller.dart';
import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/controllers/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// Página que permite ao usuário precisar a localização do lugar sendo
// cadastrado. É carregada logo após o envio das informações esperadas
// pela página de cadastro.

class ChoosePlace extends StatefulWidget {
  final VoidCallback refreshMap;

  final String name;

  final String address;

  final String description;

  final String cathegories;

  final String capacity;

  final bool isPublic;

  final String? thumbnail;

  const ChoosePlace(
      {required this.refreshMap,
      required this.name,
      required this.address,
      required this.description,
      required this.cathegories,
      required this.capacity,
      required this.isPublic,
      this.thumbnail,
      Key? key})
      : super(key: key);

  @override
  _ChoosePlaceState createState() => _ChoosePlaceState();
}

class _ChoosePlaceState extends State<ChoosePlace> {
  _ChoosePlaceState();
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
            widget.refreshMap();
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
            /* Navigator.push(
              context,
              MaterialPageRoute(
                // Versão que faria sentido:
                // builder: (context) => const HomePage(),
                // HACK versão que de fato funciona:
                builder: (context){
                  widget.refreshMap();
                  return const BottomFNBar();
                } 
                // É, depressão e lágrimas
              ),
            ).then(
              (value) => setState(() {}),
            ); */
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
                          height: MediaQuery.of(context).size.height / 5,
                          color: AppColors.orange,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    color: AppColors.orange,
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Esta é a sua localização atual",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white,
                                              fontSize: 26),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
          )
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
      isPublic: widget.isPublic,
      
    );
    setState(
      () {
        print('Local adicionado');
        widget.refreshMap();
        ListPlaceMarkers.placesMarker.add(
          createmarker(
            tappedPoint,
            context,
            widget.name,
            widget.address,
            widget.description,
            widget.thumbnail,
          ),
        );
      },
    );
  }
}

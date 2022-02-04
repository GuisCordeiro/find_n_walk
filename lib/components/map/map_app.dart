import 'package:findnwalk/controllers/login_controller.dart';
import 'package:findnwalk/controllers/marker_layer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import '../shared/colors.dart';

class MapApp extends StatefulWidget {
  const MapApp({Key? key}) : super(key: key);

  @override
  _MapAppState createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Marker>>(
      initialData: const [],
      future: MarkerLayerController.get(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FlutterMap(
          options: MapOptions(
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
            MarkerLayerOptions(markers: MarkerLayerController.newMarkers),
            MarkerLayerOptions(markers: snapshot.data!),
            MarkerLayerOptions(markers: [
              Marker(
                width: 130.0,
                height: 130.0,
                point: LoginController.location!,
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
                                            fontSize: 26,
                                          ),
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
            ])
          ],
        );
      },
    );
  }
}

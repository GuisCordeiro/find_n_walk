import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../shared/colors.dart';

class MapApp extends StatefulWidget {
  const MapApp({Key? key}) : super(key: key);

  @override
  _MapAppState createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  MapController controller = MapController(
    initMapWithUserPosition: true
  );
  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: controller,
      trackMyPosition: false,
      initZoom: 16,
      maxZoomLevel: 18,
      minZoomLevel: 5,
      stepZoom: 1,
      userLocationMarker: UserLocationMaker(
        personMarker: MarkerIcon(
          icon: Icon(
            Icons.person_pin,
            color: AppColors.orange,
            size: 48,
          ),
        ),
        directionArrowMarker: MarkerIcon(
          icon: Icon(
            Icons.arrow_circle_down
          ),
        ),
        ),
    );
  }
}

/*
class _MapAppState extends State<MapApp> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
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
                //onTap: _getCurrentLocation,
                child: Container(
                  child: Image.asset('lib/assets/images/cursor.png'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

 */

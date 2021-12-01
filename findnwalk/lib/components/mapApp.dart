import 'package:findnwalk/controller/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapApp extends StatefulWidget {
  const MapApp({Key? key}) : super(key: key);

  @override
  _MapAppState createState() => _MapAppState();
}

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
          attributionBuilder: (_) {
            return Text("");
          },
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

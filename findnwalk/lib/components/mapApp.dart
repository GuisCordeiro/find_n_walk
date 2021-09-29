import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapApp extends StatefulWidget {
  const MapApp({ Key? key }) : super(key: key);

  @override
  _MapAppState createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  @override
  Widget build(BuildContext context) {
  return FlutterMap(
    options: MapOptions(
      center: LatLng(51.5, -0.09),
      zoom: 16.0,
      maxZoom: 18
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
            width: 120.0,
            height: 120.0,
            point: LatLng(51.5, -0.09),
            builder: (ctx) =>
            Container(
              child: Image.asset('lib/assets/images/logoWithOutBG.png'),
            ),
          ),
        ],
      ),
    ],
  );
}
}
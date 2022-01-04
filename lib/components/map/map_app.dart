import 'package:findnwalk/components/map/marker_popup.dart';
import 'package:findnwalk/controller/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import '../shared/colors.dart';

class MapApp extends StatefulWidget {
  const MapApp({Key? key}) : super(key: key);

  @override
  _MapAppState createState() => _MapAppState();
  
}



class _MapAppState extends State<MapApp> {
    final PopupController _popupLayerController = PopupController();
    final List<LatLng> _markerPositions = [
    LatLng(44.421, 10.404),
    LatLng(45.683, 10.839),
    LatLng(45.246, 5.783),
  ];
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(lat, lng),
        zoom: 16.0,
        maxZoom: 18,
        minZoom: 5,
      ),
      children: [
        PopupMarkerLayerWidget(
          options: PopupMarkerLayerOptions(
            popupController: _popupLayerController,
            markers: _markers,
            markerRotateAlignment:
                PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
            popupBuilder: (BuildContext context, Marker marker) =>
                MarkerPopup(marker),
          ),
        )
      ],
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
                  child: Image.asset('assets/images/cursor.png'),
                ),
              ),
            ),
          ],
        ),
      ],
      
    );
  }
    List<Marker> get _markers => _markerPositions
      .map(
        (markerPosition) => Marker(
          point: markerPosition,
          width: 40,
          height: 40,
          builder: (_) => Icon(Icons.location_on, size: 40),
          anchorPos: AnchorPos.align(AnchorAlign.top),
        ),
      )
      .toList();
}


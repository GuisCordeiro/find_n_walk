import 'package:findnwalk/components/markers/place_marker.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

mixin MarkerLayerController {
  static List<Marker> newMarkers = [];

  static Future<List<Marker>> get(BuildContext context) async {
    final List<Marker> markers = [];
    final places = await Database.getAllPlaces();
    for (Place place in places) {
      final location =
          LatLng(place.exactLocation.latitude, place.exactLocation.longitude);
      markers.add(
        PlaceMarker(
          context: context,
          name: place.name,
          address: place.address,
          description: place.description,
          isPublic: place.isPublic,
          location: location,
        ),
      );
    }
    return markers;
  }
}

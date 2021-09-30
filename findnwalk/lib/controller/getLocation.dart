import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({ Key? key }) : super(key: key);

  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  double lat = 0;
  double lng = 0;
  _getCurrentLocation()async{
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = position.latitude;
      lng = position.longitude;
    }); 
    print("latitude: $lat,longitude: $lng");

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
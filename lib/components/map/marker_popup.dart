import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MarkerPopup extends StatefulWidget {
  final Marker marker;
  const MarkerPopup(this.marker, { Key? key }) : super(key: key);

  @override
  _MarkerPopupState createState() => _MarkerPopupState(marker);
}

class _MarkerPopupState extends State<MarkerPopup> {
  final Marker _marker;
  _MarkerPopupState(this._marker);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Row(
          children: [
            Text('1'),
            Text('2')
          ],
        ),
      ),
    );
  }
}
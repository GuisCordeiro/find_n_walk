import 'package:findnwalk/components/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PlaceMarker extends Marker {
  final LatLng location;

  final String name;

  final String address;

  final String description;

  final bool isPublic;

  final BuildContext context;

  String? thumbnail;

  PlaceMarker({
    required this.location,
    required this.name,
    required this.address,
    required this.description,
    required this.isPublic,
    required this.context,
    this.thumbnail,
  }) : super(
          width: 130,
          height: 130,
          point: location,
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
                              height: MediaQuery.of(context).size.height / 12,
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      isPublic ? name : '$name (privado)',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
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
                                    address,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              description,
                              style: const TextStyle(
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
            child: const Icon(
              Icons.place,
              size: 60,
              color: AppColors.orange,
            ),
          ),
        );
}

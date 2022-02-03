import 'package:findnwalk/components/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

createmarker(LatLng tappedPoint, context, String placeName, String placeAdress,
    String placeDescription, String? placeThumbnail) {
  return Marker(
    width: 130,
    height: 130,
    point: tappedPoint,
    builder: (ctx) => GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Container(
              height: MediaQuery.of(context).size.height / 3,
              color: AppColors.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: AppColors.orange,
                        height: MediaQuery.of(context).size.height / 12,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                placeName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                    fontSize: 26),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              placeAdress,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  fontSize: 12),
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
                        placeDescription,
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

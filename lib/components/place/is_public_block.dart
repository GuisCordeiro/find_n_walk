import 'package:findnwalk/components/place/base_block.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:flutter/material.dart';

class IsPublicBlock extends StatelessWidget {
  final Place place;
  const IsPublicBlock({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Block(
      height: 50,
      child: Center(
          child: Text(
        content(place),
        style: const TextStyle(
          color: AppColors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      )),
    );
  }

  content(Place place) {
    if (place.isPublic) {
      return "Este local é público";
    } else {
      return "Este local é privado";
    }
  }
}

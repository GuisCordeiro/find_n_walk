import 'package:findnwalk/components/place/base_block.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:flutter/material.dart';

class PlacesPictures extends StatefulWidget {
  final Place place;
  const PlacesPictures({Key? key, required this.place}) : super(key: key);

  @override
  _PlacesPicturesState createState() => _PlacesPicturesState();
}

class _PlacesPicturesState extends State<PlacesPictures> {
  @override
  Widget build(BuildContext context) {
    if (widget.place.pictures == null) {
      return const Center(
        child: Block(
          height: 200,
          width: 300,
          child: Center(
            child: Text(
              "Nenhuma imagem cadastrada!",
              style: TextStyle(fontSize: 18, color: AppColors.grey),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              widget.place.pictures!.length,
              (int index) => Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      //TODO trocar o container por imagem
                      Container(
                        width: 300,
                        height: 200,
                        color: AppColors.grey,
                        child: Text(index.toString()),
                      ),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  )),
        ),
      );
    }
  }
}

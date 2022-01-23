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
    //TODO Trocar != por ==
    if (widget.place.pictures != null) {
      return const Center(
        child: Text("Nenhuma imagem registrada!"),
      );
    } else {
      return SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              //TODO Substituir o 10 pelo length
              //widget.place.pictures!.length,
              10,
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

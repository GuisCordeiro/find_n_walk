import 'package:findnwalk/components/place/base_block.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/data/models/place.dart';
import 'package:findnwalk/data/providers/storage.dart';
import 'package:flutter/material.dart';

class PlacesPictures extends StatefulWidget {
  final Place place;
  const PlacesPictures({Key? key, required this.place}) : super(key: key);

  @override
  _PlacesPicturesState createState() => _PlacesPicturesState();
}

// Fetch image here
class _PlacesPicturesState extends State<PlacesPictures> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Block(
        height: 200,
        width: 300,
        child: widget.place.hasThumb
            ? FutureBuilder(
                future: Storage.getDownloadThumb(widget.place.id!),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(
                      snapshot.data!,
                      fit: BoxFit.contain,
                      height: 200,
                      width: 300,
                    );
                  } else {
                    return const Text('Carregando...');
                  }
                },
              )
            : const Text(
                "Nenhuma imagem cadastrada!",
                style: TextStyle(fontSize: 18, color: AppColors.grey),
              ),
      ),
    );
  }
}

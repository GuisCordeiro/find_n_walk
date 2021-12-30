import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool favorite;
  const FavoriteButton({Key? key, required this.favorite}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    if (isFavorite == false) {
      return IconButton(
          color: Colors.red,
          onPressed: () {
            isFavorite = true;
            setState(() {});
          },
          icon: Icon(Icons.favorite_border));
    } else {
      return IconButton(
          color: Colors.red,
          onPressed: () {
            isFavorite = false;
            setState(() {});
          },
          icon: Icon(Icons.favorite, color: Colors.red));
    }
  }
}

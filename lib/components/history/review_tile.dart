import 'package:findnwalk/data/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../pages/place/place_page.dart';
import '../shared/colors.dart';

//Este widget deve receber a nota da avaliação relacinada ao usuario e ao local,
// mas por enquanto está recebendo a nota geral do local

reviewTile(Place place, BuildContext context) {
  return ListTile(
      title: Text(
        place.name,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: RatingBar(
        initialRating: rateValue(place),
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        ratingWidget: RatingWidget(
          full: const Icon(Icons.star, color: AppColors.orange),
          half: const Icon(Icons.star_half, color: AppColors.orange),
          empty: const Icon(Icons.star_border, color: AppColors.orange),
        ),
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        onRatingUpdate: (x) {},
        ignoreGestures: true,
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          checkThumbnail(place),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlacePage(place: place),
            ));
      });
}

checkThumbnail(Place place) {
  if (place.thumbnail == null) {
    return const SizedBox(width: 10, height: 10);
  } else {
    return Image.asset(place.thumbnail!);
  }
}

rateValue(Place place) {
  if (place.rating == null) {
    return 0.0;
  } else {
    return place.rating;
  }
}

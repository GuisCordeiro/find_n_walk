import 'package:findnwalk/classes/placeClass.dart';
import 'package:findnwalk/components/places/placeCard.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//Este widget deve receber a nota da avaliação relacinada ao usuario e ao local, mas por enquanto está recebendo a nota geral do local

evaluationTile(Place place, BuildContext context) {
  return ListTile(
      title: Text(place.name, style: TextStyle(fontSize: 18),),
      subtitle: RatingBar(
        initialRating: rateValue(place),
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        ratingWidget: RatingWidget(
          full: Icon(Icons.star, color: AppColors.orange),
          half: Icon(Icons.star_half, color: AppColors.orange),
          empty: Icon(Icons.star_border, color: AppColors.orange),
        ),
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        onRatingUpdate: (x){},
        ignoreGestures: true,
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          checkThumbnail(place),
        ],
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return placeCard(place);
            });
      });
}

checkThumbnail(Place place) {
  if (place.thumbnail == null) {
    return Container(width: 10, height: 10);
  } else {
    return Image.file(place.thumbnail!);
  }
}

rateValue(Place place) {
  if (place.rate == null) {
    return 0.0;
  } else {
    return place.rate;
  }
}
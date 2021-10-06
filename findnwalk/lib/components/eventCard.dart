import 'package:findnwalk/api/eventClass.dart';
import 'package:findnwalk/components/colors.dart';
import 'package:flutter/material.dart';

eventCard(Events event) {
  return AlertDialog(
      title: Text(event.title,
          style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 25)),
      actions: [
        Center(
          child: Column(
            children: [
              titleText("Categoria"),
              commonText(event.cathegory),
              space(),
              titleText("Horário de Início"),
              commonText(event.startTime.toString()),
              space(),
              titleText("Duração"),
              commonText(event.duration.toString()),
              space(),
              titleText("Local"),
              commonText(event.location),
              space(),
              titleText("Número de Participantes"),
              commonText("${event.currentMembers}/${event.maxMembers}"),
              space(),
              titleText("Descrição"),
              commonText(event.description),
            ],
          ),
        ),
      ]);
}

titleText(String text) {
  return Text(
    text,
    style: TextStyle(
        color: AppColors.orange, fontWeight: FontWeight.bold, fontSize: 20),
  );
}

commonText(String text) {
  return Text(
    text,
    style: TextStyle(color: AppColors.black, fontSize: 15),
  );
}

space() {
  return Container(
    height: 10,
  );
}

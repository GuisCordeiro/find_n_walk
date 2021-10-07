import 'package:findnwalk/api/eventClass.dart';
import 'package:findnwalk/components/eventCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*
  Cria uma lista de evento de uma forma dinâmica
*/

eventTile(Events event, BuildContext context) {
  return ListTile(
      title: Text(event.title),
      subtitle: Text(DateFormat('dd/MM/yyyy – kk:mm').format(event.startTime)),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(event.iconName),
        ],
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return eventCard(event);
            });
      });
}

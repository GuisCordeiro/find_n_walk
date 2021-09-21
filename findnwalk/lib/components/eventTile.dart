import 'package:findnwalk/api/eventClass.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

eventTile(Events event) {
  return ListTile(
    title: Text(event.title),
    subtitle: Text(DateFormat('dd/MM/yyyy – kk:mm').format(event.startTime)),
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(event.iconName),
      ],
    ),
  );
}
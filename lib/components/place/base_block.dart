import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final double height;
  final dynamic child;
  const Block({Key? key, required this.height, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(8.0),
          height: height,
          width: MediaQuery.of(context).size.width,
          child: child,
        ));
  }
}

import 'package:findnwalk/components/place/base_block.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:flutter/material.dart';

class TextBlock extends StatelessWidget {
  final String title;
  final String subtitle;
  final double? height;
  const TextBlock({
    Key? key,
    required this.title,
    required this.subtitle,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double auxHeight = 60;
    if (height != null) {
      auxHeight = height!;
    }
    return Block(
      height: auxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Text>[
          Text(
            title,
            style: const TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

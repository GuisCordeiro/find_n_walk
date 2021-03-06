import 'package:findnwalk/components/place/base_block.dart';
import 'package:findnwalk/components/shared/colors.dart';
import 'package:findnwalk/data/models/user.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      title: Center(
        child: Text(
          user.name,
          style: const TextStyle(
            color: AppColors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Block(
            height: 200,
            child: SingleChildScrollView(
              child: Text(
                content(user),
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        )
      ],
    );
  }

  content(user) {
    if (user.bio == null) {
      return "Sem biografia!";
    } else {
      return user.bio.toString();
    }
  }
}

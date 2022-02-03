import 'package:findnwalk/components/place/text_block.dart';
import 'package:findnwalk/components/shared/user_card.dart';
import 'package:findnwalk/data/models/user.dart';
import 'package:flutter/material.dart';

class AuthorBlock extends StatelessWidget {
  final User user;

  const AuthorBlock({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return UserCard(user: user);
          },
        );
      },
      child: TextBlock(
        title: "Criado por",
        subtitle: user.name,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'colors.dart';

/*
  Appbar do aplicativo, declarar com as seguinte sintaxe:
  appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: FNAppBar('Nome da página', Icon(Icons.iconeDesejado),PaginaDeDestinoDoIcone(),true or false <--- serve para decidir se terá ou não arrowback))
      )
*/

class FNAppBar extends StatelessWidget {
  final String pageName;
  final Icon icon;
  final Widget page;
  final bool arrow;

  const FNAppBar(this.pageName, this.icon, this.page, this.arrow, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        automaticallyImplyLeading: arrow,
        title: Text(
          pageName,
          style: const TextStyle(color: AppColors.black),
        ),
        actions: <Widget>[
          IconButton(
            color: AppColors.black,
            icon: icon,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => page,
                  ));
            },
          )
        ],
      ),
    );
  }
}

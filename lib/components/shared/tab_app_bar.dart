import 'package:flutter/material.dart';

import 'colors.dart';

/*
  Appbar do aplicativo, declarar com as seguinte sintaxe:
  appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: TabFNAppBar('Nome da página', Icon(Icons.iconeDesejado),PaginaDeDestinoDoIcone(),true or false <--- serve para decidir se terá ou não arrowback))
      )
*/

class TabFNAppBar extends StatelessWidget {
  final String pg1;
  final String pg2;
  final String pageName;
  final Icon icon;
  final Widget page;
  final bool arrow;

  const TabFNAppBar(
      this.pageName, this.icon, this.page, this.arrow, this.pg1, this.pg2,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.orange,
      bottom: TabBar(
        labelColor: AppColors.black,
        indicatorColor: AppColors.black,
        tabs: <Widget>[
          Text(
            pg1,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            pg2,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
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
              ),
            );
          },
        )
      ],
    );
  }
}

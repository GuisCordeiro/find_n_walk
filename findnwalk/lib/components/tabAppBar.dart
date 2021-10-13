import 'package:findnwalk/components/colors.dart';
import 'package:flutter/material.dart';

/*
  Appbar do aplicativo, declarar com as seguinte sintaxe:
  appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: TabFNAppBar('Nome da página', Icon(Icons.iconeDesejado),PaginaDeDestinoDoIcone(),true or false <--- serve para decidir se terá ou não arrowback))
      )
*/


class TabFNAppBar extends StatelessWidget {

  @override
  String pg1;
  String pg2;
  String pageName;
  Icon icon;
  Widget page;
  bool arrow;
  TabFNAppBar(this.pageName, this.icon, this.page, this.arrow,this.pg1,this.pg2);
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.orange,
        bottom: TabBar(
          labelColor: AppColors.black,
          indicatorColor: AppColors.black,
          tabs: <Widget>[
            Text(
              '$pg1',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '$pg2',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: arrow,
        title: Text(
          '$pageName',
          style: TextStyle(
            color: AppColors.black
          ),
        ),
        actions: <Widget>[
          IconButton(
            color: AppColors.black,
            icon: icon,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => page,
                )
              );
            },
          )
        ],
      );
  }
}
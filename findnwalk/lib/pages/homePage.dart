import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:findnwalk/components/mapApp.dart';
import 'package:flutter/material.dart';

/*
  Página principal
*/

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MapApp(),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: AnimSearchBar(
                helpText: 'Pesquisar...',
                width: MediaQuery.of(context).size.width,
                textController: textController,
                onSuffixTap: (){
                  setState(() {
                    textController.clear();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
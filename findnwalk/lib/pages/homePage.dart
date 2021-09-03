import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

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
        child: ListView(
          children: [
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
            )
          ],
        ),
      ),
    );
  }
}
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:findnwalk/components/addButton.dart';
import 'package:findnwalk/components/colors.dart';
import 'package:findnwalk/components/mapApp.dart';
import 'package:findnwalk/controller/variables.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/*
  Página principal
*/

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  _getCurrentLocation()async{
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if(lat == 0 || lng == 0){
      setState(() {
        lat = position.latitude;
        lng = position.longitude;
      });  
    }
    print("latitude: $lat,longitude: $lng");

  }
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddButton(),
      body: SafeArea(
        child: FutureBuilder(
          future:_getCurrentLocation(),
          builder: (context, snapshot){
            if (lat != 0) {
              return Stack(
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
              );
            } else{
              return Center(
                child: Text(
                  'Não foi possível carregar o mapa :(',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                  ),
                )
              );
            }
          }
        ),
      ),
    );
  }
}



/*TypeAheadField(
  textFieldConfiguration: TextFieldConfiguration(
    autofocus: true,
    style: DefaultTextStyle.of(context).style.copyWith(
      fontStyle: FontStyle.italic
    ),
    decoration: InputDecoration(
      border: OutlineInputBorder()
    )
  ),
  suggestionsCallback: (pattern) async {
    return await BackendService.getSuggestions(pattern);
  },
  itemBuilder: (context, suggestion) {
    return ListTile(
      leading: Icon(Icons.shopping_cart),
      title: Text(suggestion['name']),
      subtitle: Text('\$${suggestion['price']}'),
    );
  },
  onSuggestionSelected: (suggestion) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductPage(product: suggestion)
    ));
  },
)*/
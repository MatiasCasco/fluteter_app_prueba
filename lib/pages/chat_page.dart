import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluteter_app_prueba/pages/images_page.dart';
import 'package:fluteter_app_prueba/widget/my_appbart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String name;

  const ChatPage({Key key, @required this.name}) : assert(name != null), super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: <Widget>[
        MyAppbar(
          leftIcon: "assets/icons/back.svg",
          // rightIcon: "https://image.flaticon.com/icons/svg/2190/2190508.svg",
          rightIcon: "assets/icons/galery.svg",
          onLeftClick: ()=>Navigator.pop(context),
          onRightClick: () {
            Navigator.pushNamed(context, ImagesPage.routeName, arguments: ImagesPageArgs(username: "Mateo Bejamin", isActivity: true));
          },
        ),
         Expanded(child: Center(child: Stack(children: <Widget>[
           Text(widget.name),
           Container(
             width: 300,
             height: 300,
             color: Colors.teal,
             child: CachedNetworkImage( // imagen de la red con cache con el simbolo de cargando
               imageUrl: 'https://image.freepik.com/foto-gratis/vista-superior-manos-sosteniendo-figura-familiar-espacio-copia_23-2148488159.jpg',
               fit: BoxFit.cover,
               placeholder: (BuildContext context, String text){
                 return Center(
                   child: CupertinoActivityIndicator(radius: 15,),
                 );
               },
             ),
             /* imagen de la red
                  child: Image.network('https://image.freepik.com/foto-gratis/vista-superior-manos-sosteniendo-figura-familiar-espacio-copia_23-2148488159.jpg',
                    fit: BoxFit.cover),*/
           ),
           Positioned(
             left: 30,
             top: 200,
             child: Text("My Family", style: TextStyle(fontSize: 20, color: Colors.pinkAccent),),
           ),
           Container( // imagen local
             width: 130,
             height: 130,
             color: Colors.teal,
             child: Image.asset(
               'assets/coronaVirus.jpg',
               fit: BoxFit.cover,
             ),
           ),
           Positioned(
             left: 30,
             top: 100,
             child: Text("Proteger a la familia \n del Corona Virus", style: TextStyle(fontSize: 18, color: Colors.teal),),
           ),
         ],))),
      ],),
    )),);
  }
}

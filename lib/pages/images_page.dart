import 'dart:io';

import 'package:fluteter_app_prueba/widget/my_appbart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';

class ImagesPageArgs {
  final String username;
  final bool isActivity;
  // haciamos retornar en el child: Text() esa informacion para mostrar como pasabamos datos en el parametro
  ImagesPageArgs({@required this.username, @required this.isActivity});
}

class ImagesPage extends StatefulWidget {
  static final routeName = 'images';
  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {

  File _file;
  pickImage() async {
    final File file = (await ImagePicker().getImage(source: ImageSource.gallery)) as File;
    //OJo en la version anterior no usaba parentesis el construtor
    //final File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    // final File file = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _file = file;
    });
  }
  @override
  Widget build(BuildContext context) {

    final ImagesPageArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(body: SafeArea(child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: <Widget>[
        MyAppbar(
          leftIcon: "assets/icons/back.svg",
          //rightIcon: "https://image.flaticon.com/icons/svg/2190/2190508.svg",
          rightIcon: "assets/icons/camera.svg",
          onLeftClick: ()=>Navigator.pop(context),
          onRightClick: () => pickImage(),
        ),
        Expanded(
          //usamos GridView.builder cuando vamos usar grandes cantidades de elementos
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
              ),
              itemBuilder: (_, index){
                 return Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    child: Text("${index+1}"),
                );},
              itemCount: 1000,
              )),
            /* Esta es la forma mas sencilla de trabajar con una grilla
            child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children:List.generate(50, (index){
              return Container(
                color: Colors.black12,
                alignment: Alignment.center,
                child: Text("${index+1}"),
              );
            }),*/

          /* Remplazo esto para trabajar con lista de tipo grilla
          Este era uso de la galeria y camara en ves del child de ahora
          child: Center(

            child: Stack(
              children: <Widget>[
                Container( // imagen local
                  width: 300,
                  height: 300,
                  color: Colors.teal,
                  child: _file == null ? Image.asset('assets/coronaVirus.jpg',
                    fit: BoxFit.cover,): Image.file(_file),
                ),
              ],
            ),
        )*/

      ],),
    )),);
  }
}

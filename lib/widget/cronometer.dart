import 'dart:async';

import 'package:fluteter_app_prueba/widget/circle_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class Cronometer extends StatefulWidget{
  final double initTime;

  const Cronometer({Key key, this.initTime= 0}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CronometerState();

}

class CronometerState extends State<Cronometer> with AfterLayoutMixin{
  double _time;
  Timer _timer;

  void _star(){
    _timer = Timer.periodic(Duration(seconds: 1), (Timer _){
      setState(() {
        _time += 1;
      });
    });
  }

  void _stop(){
    _timer?.cancel();
  }
  @override
  void initState(){
    super.initState();
    print("initState");
    _time = widget.initTime;
  }
  // La siguiente funcion es de state
  // Se ejecuta inmediatamente depues initState
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    showDialog(context: this.context,
        builder: (BuildContext context){
        return AlertDialog(
          title: Text("AfterFirstLayout"),
        );
    });
  }

  @override
  void dispose(){

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical:  20),
      child: Column(
        children: <Widget>[
          Text(_time.toString(), style: TextStyle(fontSize: 42)),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                // debo agregar parametro para la medida del icono
                child: CircleContainer(child: Icon(Icons.play_arrow), size: 65,),
                onPressed: _star,
                ),
              CupertinoButton(
                // debo agregar parametro para la medida del icono
                child: CircleContainer(child: Icon(Icons.stop), size: 65),
                onPressed: _stop,)
            ],
          )
        ],
      ),
    );
  }


}
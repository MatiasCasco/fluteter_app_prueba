import 'package:flutter/material.dart';

class HistorialTab extends StatefulWidget {
  @override
  _HistorialTabState createState() => _HistorialTabState();
}

class _HistorialTabState extends State<HistorialTab> {
  @override
  Widget build(BuildContext context) {
    print("Historial");
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
          return Container(
            color: Colors.blue,
            height: constraints.maxHeight/3,
          );
        },
    );
  }
}

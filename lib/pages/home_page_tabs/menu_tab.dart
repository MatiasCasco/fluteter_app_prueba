import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab>/* with AutomaticKeepAliveClientMixin*/{
 // bool _isEnabled = false;
/* Ya no es necesario solo con page view utilizamos esto
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
*/
  @override
  Widget build(BuildContext context) {
    //print("Menu");
    return Text("Menu");
  }

}

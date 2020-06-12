import 'package:fluteter_app_prueba/widget/my_appbart.dart';
import 'package:flutter/material.dart';

class PostPage2 extends StatefulWidget {
  static final routeName = "posts2";
  @override
  _PostPage2State createState() => _PostPage2State();
}

class _PostPage2State extends State<PostPage2> {
  List<String> _data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              MyAppbar(
                leftIcon: "assets/icons/back.svg",
                rightIcon: "assets/icons/chats.svg",
                //rightIcon: "https://image.flaticon.com/icons/svg/83/83574.svg",
                onLeftClick: () => Navigator.pop(context),
                onRightClick: () {
                  /*
                  setState(() {
                    _data.add("item ${DateTime.now()}");
                  });*/
                  /*Insertar en el ante penultimo si la lista es > 0 o sino en el primero */
                  setState(() {
                    _data.insert(_data.length > 0 ? _data.length-1 : 0,
                        "item is ${DateTime.now()}");
                  });
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int position) {
                    final String item = _data[position];
                    // return Text(item);
                    return ListTile(
                      title: Text(item),
                      subtitle: Text(DateTime.now().toString()),
                      leading: Icon(Icons.watch),
                      onTap: () {},
                      onLongPress: () {
                        setState(() {
                          _data.removeAt(position);
                        });
                      },
                    );
                  },
                  itemCount: _data.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

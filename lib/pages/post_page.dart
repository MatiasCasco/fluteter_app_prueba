import 'package:fluteter_app_prueba/widget/my_appbart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/fake_list.dart';

class PostPage extends StatefulWidget {
  static final routeName = 'posts';
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(children: <Widget>[
              MyAppbar(
                leftIcon: "assets/icons/back.svg",
                rightIcon: "assets/icons/chats.svg",
                //rightIcon: "https://image.flaticon.com/icons/svg/83/83574.svg",
                onLeftClick: ()=>Navigator.pop(context),
                onRightClick: () {},
              ),
              Expanded(child: ListView.builder(itemBuilder: (BuildContext context, int position) {
                final String item = fakeList[position];
                // return Text(item);
                return ListTile(
                  title: Text(item),
                  subtitle: Text(DateTime.now().toString()),
                  leading: Icon(Icons.watch),
                  onTap: (){},
                  onLongPress: (){},
                );
              },
              itemCount: fakeList.length,)
              // La primera y segunda es dentro del  ListView
              // ListView(
                /*  Segunda forma de trabajar con listas chicas
                children: fakeList.map<Widget>((String item){return Text(item);}).toList(),
                */

                   /* Primera forma de trabajar con listas chicas */
                   //children: List.generate(fakeList.length,
                     //(index){
                       //final String item = fakeList[index];
                      // return Text(item);
                    //},
                  //)
             // ),
              )
              ],))
          ),
         );
  }
}


import 'package:fluteter_app_prueba/pages/login_page.dart';
import 'package:fluteter_app_prueba/utils/dialogs.dart';
import 'package:fluteter_app_prueba/widget/avatar.dart';
import 'package:fluteter_app_prueba/widget/left_right_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AjusteTab extends StatefulWidget {
  @override
  _AjusteTabState createState() => _AjusteTabState();
}

class _AjusteTabState extends State<AjusteTab> {
  _confirm() async{
    final isOk = await Dialogs.Confirm(context,
        title: "Confirmacion Requerida",
        body: "Desea salir de la app?"/*,onConfirm: _logOut*/);
    print("isOK $isOk");
    if(isOk){_logOut();}
    /*showDialog(
        context: context,
        barrierDismissible: false, // hace que el dialogo no desaparesca hasta apretar alguna de las opciones de botones
        builder: (_){
      return AlertDialog(
        title: Text("Confirmacion Requerida"),
        content: Text("Desea salir de la app?"),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.pop(context);
            _logOut();
          }, child: Text("Si")),
          FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("No"))
        ],
      );
    });*/
  }
  _logOut() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (_)=>false);
  }

  _setEmail(){
    Dialogs.intputEmail(context, onOk: (String text){
      print("input dialog $text");
    }, label: "Ingrese un email",
    placeholder: "example@gmail.com");
  }

  @override
  Widget build(BuildContext context) {
    /*print("Ajuste");
    return Center(child: CupertinoButton(child: Text("Cerrar Sesion"), onPressed: _logOut));*/
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Container(
                  color: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Avatar(size: 150),
                      TextButton(child: Text("UPLOAD"),
                        onPressed: ()=> print("UPLOADING"),),
                      /*FlatButton se volvio obsoleto lo remplaza TextButton
                      FlatButton(child: Text("UPLOAD"),
                        onPressed: ()=> print("UPLOADING"),),*/
                      /*
                          CupertinoButton(child: Text("SEND"),
                              color: Colors.blue,
                              onPressed: ()=> print("SENDING")),

                           _isEnabled == true ? Cronometer(initTime: 60,): Container(),
                          CupertinoButton(
                            onPressed: (){
                              setState(() {
                                _isEnabled = !_isEnabled;
                              });
                            },
                            color: Colors.blue,
                            child: Text("enabled: $_isEnabled"),
                          ),
                          CupertinoButton(
                            child: Text("Go to chat"),
                            color: Colors.indigo,
                              onPressed: () {
                                final route = MaterialPageRoute(builder:(BuildContext _)=> ChatPage(name: "Matias Cantero",) ); // _ es un context,
                                Navigator.push(context, route);}
                          ),
                          MyBtn(label: "My Posts", onPressed: (){Navigator.pushNamed(context, PostPage.routeName);}),
                          // MyBtn(label: "My Contacts", onPressed: (){Navigator.pushNamed(context, PostPage2.routeName);},)
                        */
                    ],
                  )
              ),
              LeftRightIconButton(
                leftIcon: "assets/icons/mail.svg",
                rightContent: Text("matias@gmail.com", style: TextStyle(color: Colors.blueGrey),), /*SvgPicture.asset("assets/icons/downArrow.svg"),*/
                label:"Email",
                //onPressed: _confirm,
                onPressed: _setEmail,
              ),
              LeftRightIconButton(
                leftIcon: "assets/icons/security.svg",
                rightContent: SvgPicture.asset("assets/icons/rightArrow.svg", width: 25,),/*SvgPicture.asset("assets/icons/downArrow.svg"),*/
                label:"Configuraciones de privacidad",
                onPressed: _confirm,),
              LeftRightIconButton(
                leftIcon: "assets/icons/Bell.svg",
                rightContent: Text("ACTIVADO", style: TextStyle(color: Colors.blueGrey),),/*SvgPicture.asset("assets/icons/downArrow.svg"),*/
                label:"Notificaciones Push",
                onPressed: _confirm,),
              LeftRightIconButton(
                leftIcon: "assets/icons/exit.svg",
                rightContent: SvgPicture.asset("assets/icons/downArrow.svg", width: 25,),
                label:"Cerrar Sesion",
                onPressed: _confirm,),
              /*Container(
                  height: 120,
                  child: ListView.builder(itemBuilder: (_, index){
                    return Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.all(5),

                      color: Colors.black12,
                    );
                  },itemCount: 10,
                    scrollDirection: Axis.horizontal,)
              ),
              SizedBox(height: 20),
              Container(
                  height: 120,
                  child: ListView.builder(itemBuilder: (_, index){
                    return Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.all(5),

                      color: Colors.black12,
                    );
                  },itemCount: 10,
                    scrollDirection: Axis.horizontal,)
              ),
              SizedBox(height: 20),
              Container(
                  height: 120,
                  child: ListView.builder(itemBuilder: (_, index){
                    return Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.all(5),

                      color: Colors.black12,
                    );
                  },itemCount: 10,
                    scrollDirection: Axis.horizontal,)
              ),
              SizedBox(height: 20),
              Container(
                  height: 120,
                  child: ListView.builder(itemBuilder: (_, index){
                    return Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.all(5),

                      color: Colors.black12,
                    );
                  },itemCount: 10,
                    scrollDirection: Axis.horizontal,)
              ),*/
            ]),
      ),
    );

  }
}

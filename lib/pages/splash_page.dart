

import 'package:after_layout/after_layout.dart';
import 'package:fluteter_app_prueba/pages/home_page.dart';
import 'package:fluteter_app_prueba/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin{

  @override
  void initState() {
    super.initState();
  }


  @override
  void afterFirstLayout(BuildContext context) {
    // pongo guion bajo porque no hago uso del parametro definido
    Future.delayed(Duration(seconds: 2)).then((_){
      this._checkLogin();
      /* En vez de ir directamente a homePage remplazamos para que vayamos en login
      print("ir a home");
      // Navigator.pushNamed(context, "homePage");
      Navigator.pushReplacementNamed(context, HomePage.routeName);
       */
      /*  este ando pero cambio  porque agregue sharedPreferes
      print("ir a login");
      Navigator.pushReplacementNamed(context, LoginPage.routeName);*/
    });
  }

  _checkLogin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool wasLogin = prefs.getBool("wasLogin");
    print("wasLogin $wasLogin");
    if(wasLogin == null || wasLogin == false){
      print("ir a login");
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    } else {
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CupertinoActivityIndicator(radius: 15,),),);
  }
}

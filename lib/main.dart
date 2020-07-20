import 'package:fluteter_app_prueba/pages/images_page.dart';
import 'package:fluteter_app_prueba/pages/login_page.dart';
import 'package:fluteter_app_prueba/pages/post_page.dart';
import 'package:fluteter_app_prueba/pages/post_page2.dart';
import 'package:fluteter_app_prueba/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          final FocusScopeNode focus = FocusScope.of(context);
          if(focus.hasPrimaryFocus){
            focus.unfocus();
          }
        },
        child: MaterialApp(
          // home: HomePage(),
          home: SplashPage(),
          routes: {
            ImagesPage.routeName: (BuildContext context)=> ImagesPage(),
            // 'homePage': (BuildContext context)=> HomePage(),
            HomePage.routeName: (BuildContext context)=> HomePage(),
            PostPage.routeName:(_)=> PostPage(),
            PostPage2.routeName:(_)=> PostPage2(),
            LoginPage.routeName: (_)=> LoginPage(),
          },
        )
    );
  }

}


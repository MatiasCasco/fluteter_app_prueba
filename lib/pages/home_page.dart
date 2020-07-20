import 'package:fluteter_app_prueba/pages/home_page_tabs/ajuste_tab.dart';
import 'package:fluteter_app_prueba/pages/home_page_tabs/historial_tab.dart';
import 'package:fluteter_app_prueba/pages/home_page_tabs/user_tab.dart';
import 'package:fluteter_app_prueba/pages/post_page.dart';
import 'package:fluteter_app_prueba/pages/post_page2.dart';
import 'package:fluteter_app_prueba/widget/avatar.dart';
import 'package:fluteter_app_prueba/widget/bottom_menu.dart';
import 'package:fluteter_app_prueba/widget/my_appbart.dart';
import 'package:fluteter_app_prueba/widget/my_btn.dart';
import 'package:fluteter_app_prueba/widget/my_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/circle_container.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widget/cronometer.dart';
import '../widget/bottom_menu.dart';
import 'chat_page.dart';
import 'home_page_tabs/menu_tab.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PageController _pageViewController;
  int _currentPage = 0;
  final _menu =  [ // Lista precargada
    BottomMenuItem(iconPath: "assets/icons/menu.svg", label: "Menu", content: MenuTab()),
    BottomMenuItem(iconPath: "assets/icons/history.svg", label: "Historial", content: HistorialTab()),
    BottomMenuItem(iconPath: "assets/icons/user.svg", label: "User", content: UserTab()),
    BottomMenuItem(iconPath: "assets/icons/adjust.svg", label: "Ajuste", content: AjusteTab())
  ];
  //List<int> _renderedTabs = [0];

  @override
  void initState() {
    super.initState();
    //_pageViewController = PageController(initialPage: 0, keepPage: true); cuando usamos PageView
  }

  @override
  void dispose() {
    //_pageViewController?.dispose();  cuando usamos PageView
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("My Flutter app"),
        iconTheme: IconThemeData(color: Colors.black87),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.send),
              onPressed: (){
                final route = MaterialPageRoute(builder: (BuildContext _)=>ChatPage(name: "Matias Casco",));
                Navigator.push(context, route);
              }),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){
            Navigator.pushNamed(context, PostPage2.routeName);
          })
        ],
      ),


      // Aqui le pasamos los parametros por que esta condiccionado con assert
      bottomNavigationBar: BottomMenu(
        currentPage: _currentPage,
        onChanged: (int newCurrentPage){
          setState(() {
            _currentPage = newCurrentPage;
           /* ahora comentamos porque hicimos el widget reutilizable my_page_widget
           if(!_renderedTabs.contains(newCurrentPage)){
              _renderedTabs.add(newCurrentPage);
            } */
            //_pageViewController.jumpToPage(newCurrentPage); este anda muy bien
          });
        },
        items: _menu,),
      body: Center(
        // CircleContainer se le debe pasar como parametro un Widget
        // puede ser child: Text("Hola People beautiful")
        // CircleContainer(child: SvgPicture.asset('assets/icons/mail.svg'))
        child: Column(
          children: <Widget>[
            Expanded(
              child: MyPageView(
                children: _menu.map<Widget>((item)=> item.content).toList(),
                currentPage: _currentPage, ),
              /*child: IndexedStack(
                children: List.generate(_menu.length, (index){
                  return _renderedTabs.contains(index)?_menu[index].content:Container();
                }),
                index: _currentPage,
                /* Aca iterabamos cuando se renderizaba todos los tabs
                children: _menu.map<Widget>((item)=>item.content).toList(),
                index: _currentPage,
                 */
              ),*/
              // este metodo anda de la barra de abajo y su deslisamiento
              /*
              child: PageView.builder(
                controller: _pageViewController,
                onPageChanged: (int newPage){
                  setState(() {
                    _currentPage = newPage;
                  });
                },
                itemBuilder: (context, index){
                return _menu[index].content;
               },
                itemCount: 4,
              )*/
            ),
          ],
        ),
      ),
    );
  }
}
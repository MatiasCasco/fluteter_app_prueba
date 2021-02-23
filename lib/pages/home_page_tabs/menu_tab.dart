import 'package:fluteter_app_prueba/api/account_api.dart';
import 'package:fluteter_app_prueba/widget/circle_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState
    extends State<MenuTab> /* with AutomaticKeepAliveClientMixin*/ {
  List<dynamic> _users = [];
  AccountAPI _accountAPI = AccountAPI();
  bool _isLoading = true;
  //String _nombreCurso = " "; para recibir el nombre de nuestro curso en el proyecto
  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    final users = await _accountAPI.getUsers(2);
    //final  String nombreCurso = await _accountAPI.getCurso("2");
    // print("El nombre del curso ${nombreCurso}");
    setState(() {
      _users.addAll(users);
      _isLoading = false;
      // _nombreCurso = nombreCurso;
    });
  }

  Widget _shimmer() {
    return Container(
      height: 120,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Shimmer(
              period: Duration(seconds: 2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 13,
                      width: 50,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              gradient: LinearGradient(colors: [Colors.white, Colors.grey]));
        },
        itemCount: 7,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print("Menu");
    //return CircleContainer(child: Text(_nombreCurso) , size: 100,);

    return ListView(
      children: [
        _isLoading
            ? _shimmer()
            : Container(
                height: 150,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    final dynamic item = _users[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(constraints: BoxConstraints(minWidth: 80), child: Column(
                        children: [
                          Expanded(
                              child: ClipOval(
                                child: Image.network(item['avatar']),
                              )),
                          Text(item['first_name']),
                        ],
                      ),)
                    );
                  },
                  itemCount: _users.length,
                  scrollDirection: Axis.horizontal,
                ),
              )
      ],
    );
  }
}

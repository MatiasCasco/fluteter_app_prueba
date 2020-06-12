import 'package:flutter/cupertino.dart';

class UserTab extends StatefulWidget {
  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  @override
  Widget build(BuildContext context) {
    print("User");
    return Center(child: Text("Usuario"),);
  }
}

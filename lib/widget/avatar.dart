import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'circle_container.dart';

class Avatar extends StatefulWidget {
  final double size;
  Avatar({this.size = 150});

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: <Widget>[
          SvgPicture.network('https://image.flaticon.com/icons/svg/2219/2219184.svg'),
          Positioned(
            child: CircleContainer(
              child: Icon(Icons.edit),
              size: 60
            ),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
}
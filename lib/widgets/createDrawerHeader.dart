
import 'package:flutter/material.dart';

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.all(30.0),
      padding: EdgeInsets.all(100.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            
              fit: BoxFit.contain,
              image:  AssetImage('images/ic_launcher.png'))),
//      child: Stack(children: <Widget>[
//        Positioned(
//            bottom: 12.0,
//            left: 16.0,
//            child: Text("Welcome to Flutter",
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 20.0,
//                    fontWeight: FontWeight.w500))),
//      ])
  );
}
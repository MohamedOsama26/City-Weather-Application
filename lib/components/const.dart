import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

LinearGradient sunnyBackground (){
  return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFFC208),
        Color(0xFFFF9400),
      ]
  );
}


ThemeData darkTheme(){
  return ThemeData(
    primaryColor: Color(0xFFFF9400),
    // colorScheme: Color(0xFFFF9400),
    brightness: Brightness.light,
    backgroundColor: Colors.black54,
    scaffoldBackgroundColor: Colors.white,

    // textTheme: TextTheme(
    //   headline: TextStyle(
    //     fontSize: 72.0,
    //     fontWeight: FontWeight.bold,
    //   ),
    //   title: TextStyle(
    //     fontSize: 36.0,
    //     fontStyle: FontStyle.italic,
    //   ),
    //   body1: TextStyle(
    //     fontSize: 14.0,
    //     fontFamily: 'Hind',
    //   ),
    // ),
  );
}
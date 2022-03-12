import 'package:flutter/cupertino.dart';

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
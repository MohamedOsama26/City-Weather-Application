import 'package:flutter/cupertino.dart';

LinearGradient sunnyBackground (){
  return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFF8608),
        Color(0xFFFF7300),
      ]
  );
}
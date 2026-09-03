import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle get font28Bold =>
      TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
    
  static TextStyle get whitefont24 =>
      TextStyle(color: Colors.white, fontSize: 24);

  static TextStyle get blackfont24Bold =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle get blackfont22Bold =>
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle get blackfont18Bold =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle get font16black87 =>
      TextStyle(fontSize: 16, color: Colors.black87, height: 1.4);

  static TextStyle get greyfont15 =>
      TextStyle(color: Colors.grey, fontSize: 15);

  static TextStyle get font20Bold =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}

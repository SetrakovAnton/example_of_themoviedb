import 'package:flutter/material.dart';

abstract class AppButtonStyle{
  static final ButtonStyle linkButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Color.fromRGBO(1, 180, 228, 1)),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ));
}
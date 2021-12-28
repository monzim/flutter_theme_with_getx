import 'package:flutter/material.dart';

import 'element/text_theme.dart';

// ignore: non_constant_identifier_names
ThemeData LightThemeData() {
  return ThemeData(
    brightness: Brightness
        .light, //Setting the Brightness to light  so that this can be used as Light ThemeData
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme
        .textThemeLight, //Setting the Text Theme to LightTextTheme

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepOrange,
      elevation: 0,
      centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    )),
  );
}

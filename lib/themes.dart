import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xFF129A7F),
    splashColor: const Color(0xFFFFA873),
    cardColor: const Color(0xFFB1DDD5),

    // FFA873

    textTheme: TextTheme(
      // headlines
      displayLarge:
          const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium:
          const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600),
      displaySmall: const TextStyle()
          .copyWith(fontSize: 18, fontWeight: FontWeight.normal),

      titleLarge:
          const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      bodyLarge: const TextStyle()
          .copyWith(fontSize: 14, fontWeight: FontWeight.normal),
      labelLarge: const TextStyle()
          .copyWith(fontSize: 12, fontWeight: FontWeight.normal),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFFA873),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.all(10),
            textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),

    //text form filed
    //msh sha8al dk why
    // inputDecorationTheme: InputDecorationTheme(
    //   labelStyle: TextStyle(color: Color(0xFF129A7F)),
    //   enabledBorder: UnderlineInputBorder(
    //     borderSide: BorderSide(color: Color(0xFF129A7F)),
    //   ),
    //   focusedBorder: UnderlineInputBorder(
    //     borderSide: BorderSide(color: Color(0xFF129A7F)),
    //   ),
    // ),



    //   checkbox
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.teal;
        } else {
          return Colors.transparent;
        }
      }),
    ),

    // text field theme
  );
}
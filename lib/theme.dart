
import 'package:flutter/material.dart';

ThemeData myCustomTheme() {
  return ThemeData(
    primarySwatch: Colors.blue, // Define primary color
    hintColor: Colors.orangeAccent, // Define accent color

    // Customizing AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 13, 117, 164),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    // Custom TextTheme
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      headline2: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black87),
      bodyText1: TextStyle(fontSize: 16, color: Colors.black),
      bodyText2: TextStyle(fontSize: 14, color: Colors.black54),
      button: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 13, 117, 164), // Button color

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 4,
      ),
    ),

    // Input Field Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade200,
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.blue),
      ),
      labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade700),
    ),

    // Bottom Sheet Theme
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      elevation: 5,
    ),
  );
}
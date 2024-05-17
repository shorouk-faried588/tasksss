import 'package:flutter/material.dart';

class MyTheme{


  static final MyTheme instance=MyTheme();

  ThemeData light=ThemeData.light(useMaterial3: true).copyWith(

    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.light(
        background: Colors.orange,
        ),
    ),
textTheme: const TextTheme(
     displayLarge: TextStyle(fontSize: 22,color: Colors.blue),
     bodyLarge: TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold),
     labelLarge: TextStyle(fontSize: 16,color: Colors.grey)
),
  );

  ThemeData dark=ThemeData.dark(useMaterial3: true).copyWith(

    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.dark(
        background: Colors.blue,
        ),
    ),
textTheme: const TextTheme(
     displayLarge: TextStyle(fontSize: 22,color: Colors.orange),
     bodyLarge: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),
     labelLarge: TextStyle(fontSize: 16,color: Colors.grey)
),
  );

}
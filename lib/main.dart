import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/main/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kadex 2.0',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: grayscaleDark),
        canvasColor: grayscaleWhite,
      ),
      home: MainScreen(),
    );
  }
}

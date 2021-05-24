import 'package:flutter/material.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/main/main_screen.dart';
import 'package:kadex2/screens/portfolio/portfolio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kadex 2.0',
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: grayscaleLight,
      //   textTheme: TextTheme(),
      //   // GoogleFonts.latoTextTheme(Theme.of(context).textTheme)
      //   //     .apply(bodyColor: grayscaleDark),
      //   canvasColor: grayscaleWhite,
      // ),
      theme: ThemeData(
        fontFamily: 'Lato',
        scaffoldBackgroundColor: grayscaleLight,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/portfolio': (context) => Portfolio(),
      },
    );
  }
}

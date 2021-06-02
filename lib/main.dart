import 'package:flutter/material.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/screens/main/main_screen.dart';
import 'package:kadex2/screens/portfolio/components/setup_strategy.dart';
import 'package:kadex2/screens/portfolio/portfolio.dart';
import 'package:kadex2/screens/portfolio/rebalancing_days.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kadex 2.0',
      theme: ThemeData(
        fontFamily: 'Lato',
        scaffoldBackgroundColor: grayscaleLight,
      ),
      initialRoute: '/newuser',
      routes: {
        '/newuser': (context) => MainScreen(),
        '/portfolio': (context) => Portfolio(),
        '/portfolio/rebalancing_days': (context) => RebalancingDays(),
        '/portfolio/setup_strategy': (context) => SetUpStrategy(),
      },
    );
  }
}

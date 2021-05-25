import 'package:flutter/material.dart';
import 'package:kadex2/screens/main/components/side_menu.dart';
// import 'package:kadex2/screens/portfolio/newuser_screen.dart';
import 'package:kadex2/screens/portfolio/portfolio_screen.dart';

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              child: SideMenu(),
            ),
            Expanded(
              child: PortfolioScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
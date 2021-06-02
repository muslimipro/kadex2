import 'package:flutter/material.dart';
import 'package:kadex2/models/portfolio_model.dart';
import 'package:kadex2/screens/main/components/side_menu.dart';
import 'package:kadex2/screens/portfolio/portfolio_screen.dart';
import 'package:provider/provider.dart';

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
              child: ChangeNotifierProvider(
                create: (context) => PortfolioModel(indexName: "i30"),
                child: PortfolioScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kadex2/screens/portfolio/components/history_block.dart';
import 'package:kadex2/screens/portfolio/components/portfolio_block.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            PortfolioBlock(),
            SizedBox(width: 30),
            HistoryBlock(),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/portfolio/components/line_chart.dart';
import 'package:kadex2/screens/portfolio/components/switcher_button.dart';

class HistoryBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 30),
              Text("My portfolio history", style: blockTitleStyle),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 488,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: grayscaleWhite,
            ),
            child: Column(
              children: [
                SwitcherButton(
                  switcherTextString: ['Day', 'Week', 'Month'],
                ),
                PortfolioLineChart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

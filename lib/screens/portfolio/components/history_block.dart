import 'package:flutter/material.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/screens/portfolio/components/line_chart.dart';
import 'package:kadex2/screens/portfolio/components/switcher_button.dart';
import 'package:kadex2/widgets/responsive.dart';

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
            height: Responsive.isDesktop(context) ? 488 : 438,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: grayscaleWhite,
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    SwitcherButton(
                      switcherTextString: ['Day', 'Week', 'Month'],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: PortfolioLineChart(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

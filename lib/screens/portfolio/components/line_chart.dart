import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kadex2/common/constants.dart';

class PortfolioLineChart extends StatefulWidget {
  @override
  _PortfolioLineChartState createState() => _PortfolioLineChartState();
}

class _PortfolioLineChartState extends State<PortfolioLineChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.38,
      child: Container(
        padding: EdgeInsets.zero,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: LineChart(
            mainData(),
          ),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((spotIndex) {
            final spot = barData.spots[spotIndex];
            if (spot.x == 8 || spot.x == 72) {
              return null;
            }
            return TouchedSpotIndicatorData(
              FlLine(color: secondaryLight, strokeWidth: 12),
              FlDotData(
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                      radius: 3,
                      color: Colors.white,
                      strokeWidth: 3,
                      strokeColor: secondaryDefault);
                },
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
            tooltipRoundedRadius: 20,
            tooltipPadding: EdgeInsets.all(12),
            tooltipBgColor: grayscaleWhite,
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final flSpot = barSpot;
                if (flSpot.x == 8 || flSpot.x == 72) {
                  return null;
                }

                return LineTooltipItem(
                  '08/11/20\n',
                  const TextStyle(
                    color: grayscaleAverage,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.5,
                    fontFamily: 'Lato',
                  ),
                  children: [
                    TextSpan(
                      text: '\$1925.5',
                      style: TextStyle(
                        color: grayscaleDark,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                );
              }).toList();
            }),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: grayscaleLight, //const Color(0xff37434d),
            strokeWidth: 1,
            dashArray: [6, 2],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: grayscaleAverage, //Color(0xff68737d),
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'Lato',
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 8:
                return '';
              case 10:
                return 'Mon';
              case 20:
                return 'Tue';
              case 30:
                return 'Wed';
              case 40:
                return 'Thu';
              case 50:
                return 'Fri';
              case 60:
                return 'Sat';
              case 70:
                return 'Sun';
              case 72:
                return '';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: grayscaleAverage, //Color(0xff67727d),
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'Lato',
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '\$0';
              case 1:
                return '\$200';
              case 2:
                return '\$400';
              case 3:
                return '\$600';
              case 4:
                return '\$800';
              case 5:
                return '\$1000';
            }
            return '';
          },
          reservedSize: 40,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
        show: false,
        // border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 8,
      maxX: 72,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(8, 2.4),
            FlSpot(10, 2.5),
            FlSpot(20, 3),
            FlSpot(30, 3.3),
            FlSpot(40, 3.2),
            FlSpot(50, 2.6),
            FlSpot(60, 3.4),
            FlSpot(70, 2.5),
            FlSpot(72, 2.3),
          ],
          isCurved: true,
          colors: [secondaryDefault], //gradientColors,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              // final spot = barData.spots[index];
              if (spot.x == 8 || spot.x == 72) {
                return FlDotCirclePainter(
                    radius: 0,
                    color: secondaryDefault,
                    strokeWidth: 0,
                    strokeColor: secondaryDefault);
              }
              return FlDotCirclePainter(
                  radius: 1,
                  color: Colors.white,
                  strokeWidth: 3,
                  strokeColor: secondaryDefault);
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: [
              secondaryDefault.withOpacity(0.1),
            ].map((color) => color).toList(),
          ),
        ),
      ],
    );
  }
}

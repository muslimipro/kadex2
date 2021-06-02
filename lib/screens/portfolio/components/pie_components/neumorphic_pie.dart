import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/screens/portfolio/components/pie_components/middle_ring.dart';
import 'package:kadex2/screens/portfolio/components/pie_components/progress_rings.dart';

class NeumorphicPie extends StatefulWidget {
  @override
  _NeumorphicPieState createState() => _NeumorphicPieState();
}

class _NeumorphicPieState extends State<NeumorphicPie> {
  int hoveredIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Outer white circle
    return Center(
      child: Container(
        height: 230.0,
        width: 230.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: grayscaleExtralight,
        ),
        child: Center(
          // Container of the pie chart
          child: Container(
            height: 190.0,
            width: 190.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: grayscaleExtralight,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.8),
              //     spreadRadius: 20,
              //     blurRadius: 45,
              //     offset: Offset(0, 7), // changes position of shadow
              //   ),
              // ],
            ),
            child: Stack(
              children: <Widget>[
                Center(child: MiddleRing(width: 150.0)),
                CustomPaint(
                  child: Center(),
                  painter: ProgressRings(
                    completedPercentage: 0.1,
                    circleWidth: 24.0,
                    gradient: [otherError, otherError],
                    progressStartAngle: 2 * pi * 0.9,
                    lengthToRemove: 0,
                  ),
                ),
                CustomPaint(
                  child: Center(),
                  painter: ProgressRings(
                    completedPercentage: 0.15,
                    circleWidth: 24.0,
                    gradient: [secondaryDefault, secondaryDefault],
                    progressStartAngle: 2 * pi * 0.75,
                    lengthToRemove: 0,
                  ),
                ),
                CustomPaint(
                  child: Center(),
                  painter: ProgressRings(
                    completedPercentage: 0.15,
                    circleWidth: 24.0,
                    gradient: [otherAzure, otherAzure],
                    progressStartAngle: 2 * pi * 0.6,
                    lengthToRemove: 0,
                  ),
                ),
                CustomPaint(
                  child: Center(),
                  painter: ProgressRings(
                    completedPercentage: 0.2,
                    circleWidth: 24.0,
                    gradient: [otherBlue, otherBlue],
                    progressStartAngle: 2 * pi * 0.4,
                    lengthToRemove: 0,
                  ),
                ),
                CustomPaint(
                  child: Center(),
                  painter: ProgressRings(
                    completedPercentage: 0.4,
                    circleWidth: 24.0,
                    gradient: [primaryDefault, primaryDefault],
                    progressStartAngle: 0,
                    lengthToRemove: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final innerColor = Color.fromRGBO(233, 242, 249, 1);
final shadowColor = Color.fromRGBO(220, 227, 234, 1);

const greenGradient = [
  Color.fromRGBO(223, 250, 92, 1),
  Color.fromRGBO(129, 250, 112, 1)
];
const turqoiseGradient = [
  Color.fromRGBO(91, 253, 199, 1),
  Color.fromRGBO(129, 182, 205, 1)
];

const redGradient = [
  Color.fromRGBO(255, 93, 91, 1),
  Color.fromRGBO(254, 154, 92, 1),
];
const orangeGradient = [
  Color.fromRGBO(251, 173, 86, 1),
  Color.fromRGBO(253, 255, 93, 1),
];

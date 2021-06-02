import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/screens/main/components/header.dart';
import 'package:kadex2/screens/main/components/side_menu.dart';
import 'package:kadex2/screens/portfolio/components/switcher_button.dart';

class SetUpStrategy extends StatefulWidget {
  @override
  _SetUpStrategyState createState() => _SetUpStrategyState();
}

class _SetUpStrategyState extends State<SetUpStrategy> {
  bool backHovered = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250,
                child: SideMenu(),
              ),
              Expanded(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (_) {
                                  setState(() {
                                    backHovered = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    backHovered = false;
                                  });
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/arrow_back.svg",
                                        color: backHovered
                                            ? grayscaleAverage
                                            : grayscaleDarkmode,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "Set up your strategy",
                                        style: blockTitleStyle.copyWith(
                                          color: backHovered
                                              ? grayscaleDarkmode
                                              : grayscaleDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Header(),
                            ],
                          ),
                          SizedBox(height: 40),
                          Container(
                            height: 524,
                            width: double.infinity,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              color: grayscaleWhite,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    StepCircle(number: '1'),
                                    SizedBox(width: 20),
                                    Text(
                                      'Set up your rebalancing days',
                                      style: blockSubtitleStyle.copyWith(
                                        color: grayscaleDark,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    Container(
                                      width: 42,
                                      child: SvgPicture.asset(
                                          'assets/icons/dashLine.svg'),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: SwitcherButton(
                                        switcherTextString: [
                                          '7 day',
                                          '14 days',
                                          '21 day',
                                          '30 days',
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    StepCircle(number: '2'),
                                    SizedBox(width: 20),
                                    Text(
                                      'Choose your strategy',
                                      style: blockSubtitleStyle.copyWith(
                                        color: grayscaleDark,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    Container(
                                      width: 42,
                                      child: SvgPicture.asset(
                                          'assets/icons/dashLine.svg'),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: SwitcherButton(
                                        switcherTextString: [
                                          'Even',
                                          'WMA',
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2),
                                Row(
                                  children: [
                                    SizedBox(width: 62),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 8),
                                          Text(
                                            'Equal weighted distribution',
                                            style: blockSubtitleStyle.copyWith(
                                              color: grayscaleAverage,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 8),
                                          Text(
                                            'Average rolling distribution',
                                            style: blockSubtitleStyle.copyWith(
                                              color: grayscaleAverage,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 60),
                                TextButton(
                                  onPressed: () {},
                                  style: primaryDefaultButtonStyle.copyWith(
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(310, 60)),
                                  ),
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      color: grayscaleWhite,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

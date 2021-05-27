import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/portfolio/components/pie_components/neumorphic_pie.dart';

class TopCoinsBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 30),
              Text("Top of coins", style: blockTitleStyle),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 637,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: grayscaleWhite,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: borderedBox,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Coins',
                              style: blockSubtitleStyle,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '30 seats',
                              style: blockTextStyle.copyWith(
                                  color: primaryDefault),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: borderedBox,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last rebalancing',
                              style: blockSubtitleStyle,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '2021-03-19',
                              style: blockTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: borderedBox,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rebalancing',
                              style: blockSubtitleStyle,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '7 day',
                              style: blockTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: borderedBox,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Next rebalancing',
                              style: blockSubtitleStyle,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '2021-03-19',
                              style: blockTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: borderedBox,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NeumorphicPie(),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PieDot(
                                name: 'BTC',
                                color: primaryDefault,
                              ),
                              SizedBox(height: 16),
                              PieDot(
                                name: 'ETH',
                                color: otherBlue,
                              ),
                              SizedBox(height: 16),
                              PieDot(
                                name: 'BNB',
                                color: otherAzure,
                              ),
                              SizedBox(height: 16),
                              PieDot(
                                name: 'ADA',
                                color: secondaryDefault,
                              ),
                              SizedBox(height: 16),
                              PieDot(
                                name: 'Other',
                                color: otherError,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: primaryDefaultButtonStyle.copyWith(
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size(0, 60)),
                        ),
                        child: Text(
                          "Set up rebalancing",
                          style: TextStyle(
                            color: grayscaleWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {},
                      style: primaryLightButtonStyle.copyWith(
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(60, 60)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(14),
                        ),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/share.svg",
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

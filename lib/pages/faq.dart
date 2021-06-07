import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kadex2/common/constants.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  int hovered = -1;
  List<bool> pressed;
  List<String> questions = [
    'What is the difference between Prime and Advance plans?',
    "Why can't I see my invitation link after registering?",
    "Where can I get more information about the operation of the smart portfolio i30 trading algorithm?",
    "How to register on the exchanges?",
    "How do I start earning money from i30 affiliate program recommendations?",
    "How to buy or sell USDT?",
    "Kadex Enterprise Ecosystem Development Plans",
    "Will I receive a monthly profit using your product?",
  ];
  List<String> answers = [
    'First of all configurable strategy portfolio,referral program profit, and exclusive offers from the Kadex Enterprise team, for more information visit the user profile and open the Plans/Rates section.',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  void initState() {
    super.initState();
    pressed = List<bool>.filled(questions.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 30),
            Text("FAQ", style: blockTitleStyle),
          ],
        ),
        SizedBox(height: 20),
        Container(
          height: 964,
          width: double.infinity,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: grayscaleWhite,
          ),
          child: Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          pressed[index] = !pressed[index];
                        });
                      },
                      style: whiteButtonStyle.copyWith(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: grayscaleLight,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 24,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        questions[index],
                                        style: blockTextStyle,
                                      ),
                                      SvgPicture.asset(
                                        pressed[index]
                                            ? "assets/icons/arrow_up.svg"
                                            : "assets/icons/arrow_down.svg",
                                        width: 24,
                                        color: primaryDefault,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            !pressed[index]
                                ? SizedBox.shrink()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 24),
                                      SvgPicture.asset(
                                          "assets/icons/horizontal_divider.svg"),
                                      SizedBox(height: 24),
                                      Text(
                                        answers[0],
                                        style: footnoteSemibold.copyWith(
                                          color: grayscaleDarkmode,
                                        ),
                                      )
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

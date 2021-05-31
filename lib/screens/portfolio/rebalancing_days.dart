import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/main/components/header.dart';
import 'package:kadex2/screens/main/components/side_menu.dart';
import 'package:kadex2/screens/portfolio/components/switcher_button.dart';

class RebalancingDays extends StatefulWidget {
  @override
  _RebalancingDaysState createState() => _RebalancingDaysState();
}

class _RebalancingDaysState extends State<RebalancingDays> {
  final searchFocusNode = FocusNode();
  bool searchFocused = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          searchFocused = false;
        });
      },
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
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/arrow_back.svg"),
                                  SizedBox(width: 6),
                                  Text("Rebalancing days",
                                      style: blockTitleStyle),
                                ],
                              ),
                              Header(),
                            ],
                          ),
                          SizedBox(height: 40),
                          Container(
                            height: 844,
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
                                Container(
                                  width: 540,
                                  child: SwitcherButton(
                                    switcherTextString: [
                                      '7 day',
                                      '14 day',
                                      '21 day'
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 604,
                                        decoration: borderedBox,
                                        padding:
                                            EdgeInsets.fromLTRB(30, 30, 30, 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('List of coins on Binance',
                                                style: blockSubtitleStyle),
                                            SizedBox(height: 20),
                                            TextField(
                                              onTap: () {
                                                setState(() {
                                                  searchFocused = true;
                                                });
                                              },
                                              focusNode: this.searchFocusNode,
                                              cursorColor: primaryDefault,
                                              style: blockTextStyle.copyWith(
                                                fontWeight: FontWeight.w400,
                                              ),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: searchFocused == true
                                                    ? grayscaleOffWhite
                                                    : grayscaleWhite,
                                                hoverColor: grayscaleOffWhite,
                                                hintText: 'Search of coins',
                                                hintStyle: TextStyle(
                                                    color: grayscaleAverage),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0,
                                                        vertical: 24),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: grayscaleLight),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: primaryLight),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                prefixIcon: Row(
                                                  children: [
                                                    SizedBox(width: 30),
                                                    SvgPicture.asset(
                                                      "assets/icons/search.svg",
                                                      color: searchFocused ==
                                                              true
                                                          ? primaryDefault
                                                          : grayscaleAverage,
                                                    ),
                                                    SizedBox(width: 16),
                                                  ],
                                                ),
                                                prefixIconConstraints:
                                                    BoxConstraints.tight(
                                                        Size(70, 24)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Expanded(
                                      child: Container(
                                        height: 604,
                                        decoration: borderedBox,
                                        padding:
                                            EdgeInsets.fromLTRB(30, 30, 30, 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Your blacklist',
                                                style: blockSubtitleStyle),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                TextButton(
                                  onPressed: () {},
                                  style: primaryDefaultButtonStyle.copyWith(
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(310, 60)),
                                  ),
                                  child: Text(
                                    "Save strategy",
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

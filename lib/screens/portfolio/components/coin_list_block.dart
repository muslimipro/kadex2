import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kadex2/constants.dart';

class CoinListBlock extends StatefulWidget {
  @override
  _CoinListBlockState createState() => _CoinListBlockState();
}

class _CoinListBlockState extends State<CoinListBlock> {
  int hovered = -1;
  List<String> coins = ['BTC', 'ETH', 'BNB', 'ADA', 'DOT', 'XRP'];
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
              Text("List of coins", style: blockTitleStyle),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('#', style: blockSubtitleStyle),
                      Row(
                        children: [
                          SizedBox(width: 24),
                          Text('Name', style: blockSubtitleStyle),
                        ],
                      ),
                      Text('Weight', style: blockSubtitleStyle),
                      Text('Number', style: blockSubtitleStyle),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: coins.length,
                    itemBuilder: (BuildContext context, int index) {
                      int ind = index + 1;
                      return Column(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (_) {
                              setState(() {
                                hovered = index;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                hovered = -1;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 24),
                              decoration: borderedBox.copyWith(
                                color: hovered == index
                                    ? grayscaleExtralight
                                    : grayscaleWhite,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('$ind', style: blockTextStyle),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/coins/${coins[index]}.png",
                                        height: 24,
                                      ),
                                      SizedBox(width: 16),
                                      Text(coins[index], style: blockTextStyle),
                                    ],
                                  ),
                                  Text('27.52%', style: blockSubtitleStyle),
                                  Text('0.0030', style: blockTextStyle),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
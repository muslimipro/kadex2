import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/models/portfolio_model.dart';
import 'package:provider/provider.dart';

class CoinListBlock extends StatefulWidget {
  @override
  _CoinListBlockState createState() => _CoinListBlockState();
}

class _CoinListBlockState extends State<CoinListBlock> {
  int hovered = -1;
  List<String> coins = [
    'BTC',
    'ETH',
    'BNB',
    'ADA',
    'DOT',
    'XRP',
    'BTC',
    'ETH',
    'BNB',
    'ADA',
  ];
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
          Consumer<PortfolioModel>(
            builder: (context, portfolio, child) {
              return Container(
                height: portfolio.indexName != "iCustom" ? 637 : 791,
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
                                          Text(coins[index],
                                              style: blockTextStyle),
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
                    portfolio.indexName != "iCustom"
                        ? SizedBox.shrink()
                        : SizedBox(height: 20),
                    portfolio.indexName != "iCustom"
                        ? SizedBox.shrink()
                        : Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        "/portfolio/customize_coinlist");
                                  },
                                  style: primaryDefaultButtonStyle.copyWith(
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(0, 60)),
                                  ),
                                  child: Text(
                                    "Customize coin list",
                                    style: TextStyle(
                                      color: grayscaleWhite,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

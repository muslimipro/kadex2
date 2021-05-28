import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/main/components/header.dart';
import 'package:kadex2/screens/portfolio/components/coin_list_block.dart';
import 'package:kadex2/screens/portfolio/components/history_block.dart';
import 'package:kadex2/screens/portfolio/components/portfolio_block.dart';
import 'package:kadex2/screens/portfolio/components/select_index.dart';
import 'package:kadex2/screens/portfolio/components/top_coins_block.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with TickerProviderStateMixin {
  bool activated = true;
  bool recalculate = false;
  bool activateLoading = false;
  bool recalculateLoading = false;
  List<bool> isSelected = <bool>[true, false, false];

  // Container circleContainer = Container(
  //   height: 10,
  //   width: 10,
  //   decoration: BoxDecoration(
  //     color: Colors.blue,
  //     shape: BoxShape.circle,
  //   ),
  // );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  activatePressed() async {
    setState(() {
      activateLoading = true;
    });
    await Future.delayed(Duration(seconds: 2)).then(
      (val) => {
        setState(
          () {
            activateLoading = false;
            activated = !activated;
          },
        ),
      },
    );
  }

  recalculatePressed() async {
    setState(() {
      recalculateLoading = true;
    });
    await Future.delayed(Duration(seconds: 2)).then(
      (val) => {
        setState(
          () {
            recalculateLoading = false;
            recalculate = !recalculate;
          },
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      TextButton(
                        onPressed: activateLoading
                            ? null
                            : () {
                                activatePressed();
                              },
                        style: activated
                            ? primaryLightButtonStyle
                            : primaryDefaultButtonStyle,
                        child: activateLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      activated
                                          ? primaryDefault
                                          : grayscaleWhite),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    activated
                                        ? 'assets/icons/pause.svg'
                                        : 'assets/icons/start.svg',
                                    height: 24,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    activated ? 'Pause' : 'Start',
                                    style: TextStyle(
                                      color: activated
                                          ? grayscaleDark
                                          : grayscaleWhite,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(width: 20),
                      Tooltip(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        message:
                            'If you have replenished/withdrawn\n your balance on the exchange, we\n recommend recalculating the amount\n and restarting the portfolio',
                        verticalOffset: 35,
                        height: 112,
                        textStyle: TextStyle(
                          color: grayscaleDark,
                          fontSize: 14,
                        ),
                        decoration: BoxDecoration(
                          color: grayscaleWhite,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [boxShadow],
                        ),
                        child: TextButton(
                          onPressed: (activated ||
                                  recalculateLoading ||
                                  activateLoading)
                              ? null
                              : () {
                                  recalculatePressed();
                                },
                          style: (activated || activateLoading)
                              ? whiteButtonStyle
                              : primaryLightButtonStyle,
                          child: recalculateLoading
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            primaryDefault),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Recalculate',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: (activated || activateLoading)
                                            ? grayscaleAverage
                                            : primaryDefault,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      SizedBox(width: 20),
                      SelectIndex(),
                    ],
                  ),
                  Header(),
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  PortfolioBlock(),
                  SizedBox(width: 30),
                  HistoryBlock(),
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  TopCoinsBlock(),
                  SizedBox(width: 30),
                  CoinListBlock(),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

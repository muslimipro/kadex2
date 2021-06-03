import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:kadex2/common/constants.dart';

class PortfolioBlock extends StatefulWidget {
  @override
  _PortfolioBlockState createState() => _PortfolioBlockState();
}

class _PortfolioBlockState extends State<PortfolioBlock> {
  final _freezeController = AdvancedSwitchController();
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
              Text("Portfolio", style: blockTitleStyle),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 488,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: grayscaleWhite,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$608',
                      style: TextStyle(
                          color: primaryDefault,
                          fontSize: 48,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          '+',
                          style: TextStyle(
                              color: otherSuccess,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 6),
                        Text(
                          '\$349',
                          style: TextStyle(
                              color: grayscaleDark,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: borderedBox,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "7 days",
                            style: TextStyle(
                              color: grayscaleDarkmode,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  color: otherError,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '\$123',
                                style: TextStyle(
                                  color: grayscaleDark,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "30 days",
                            style: TextStyle(
                              color: grayscaleDarkmode,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  color: otherError,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '\$101',
                                style: TextStyle(
                                  color: grayscaleDark,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              color: grayscaleDarkmode,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '+',
                                style: TextStyle(
                                  color: otherSuccess,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '\$349',
                                style: TextStyle(
                                  color: grayscaleDark,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
                              'USDT balance:',
                              style: TextStyle(
                                color: grayscaleDarkmode,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '0.71',
                              style: TextStyle(
                                color: primaryDefault,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        AdvancedSwitch(
                          controller: _freezeController,
                          activeColor: primaryDefault,
                          inactiveColor: grayscaleLight,
                          borderRadius:
                              BorderRadius.all(const Radius.circular(40)),
                          width: 64.0,
                          height: 36.0,
                          enabled: true,
                          disabledOpacity: 0.5,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Freeze',
                          style: TextStyle(
                            color: grayscaleDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () async {
                      await showDialog<String>(
                        context: context,
                        // barrierDismissible: false,
                        barrierColor: grayscaleDarkmode.withOpacity(0.3),
                        builder: (BuildContext context) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                            child: Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              elevation: 0,
                              backgroundColor: Colors.white,
                              child: Container(
                                width: 720,
                                height: 570,
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'close');
                                      },
                                      child: Text('close'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'ok');
                                      },
                                      child: Text('ok'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((answer) {
                        print(answer);
                      });
                    },
                    style: primaryDefaultButtonStyle.copyWith(
                      minimumSize: MaterialStateProperty.all<Size>(Size(0, 60)),
                    ),
                    child: Text(
                      "Sell portfolio",
                      style: TextStyle(
                        color: grayscaleWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

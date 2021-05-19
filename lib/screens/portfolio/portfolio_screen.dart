import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/main/components/header.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  bool activated = true;
  bool recalculate = false;
  bool activateLoading = false;
  bool recalculateLoading = false;

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
          padding: EdgeInsets.fromLTRB(40, 40, 80, 0),
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
                      TextButton(
                        onPressed:
                            (activated || recalculateLoading || activateLoading)
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
                                  valueColor: new AlwaysStoppedAnimation<Color>(
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
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {},
                        style: whiteButtonStyle,
                        child: Container(
                          width: buttonWidth,
                          padding: EdgeInsets.only(left: 24, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'i30',
                                style: TextStyle(
                                  color: grayscaleDark,
                                  fontSize: 18,
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/icons/index_arrow_down.svg",
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Header(),
                ],
              ),
              // Container(
              //   height: 100,
              //   width: 200,
              //   color: Colors.blueAccent,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

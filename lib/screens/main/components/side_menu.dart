import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/constants.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  var currentDrawer = 1;
  var colorText = grayscaleDark;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(40, 38, 0, 38),
              child: SvgPicture.asset(
                "assets/images/logo.svg",
                height: 60,
              ),
            ),
            Container(
              height: 60,
              child: TextButton(
                style: TextButton.styleFrom(primary: primaryDefault),
                onPressed: () {
                  setState(() {
                    currentDrawer = 1;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/menu_borderSide.svg',
                      color:
                          currentDrawer == 1 ? primaryDefault : grayscaleWhite,
                    ),
                    SizedBox(width: 36),
                    SvgPicture.asset(
                      "assets/icons/menu1_suitcase.svg",
                      color: currentDrawer == 1
                          ? primaryDefault
                          : grayscaleAverage,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Smart Portfolio",
                      style: TextStyle(
                        color: currentDrawer == 1
                            ? grayscaleDark
                            : grayscaleAverage,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 14),
            Container(
              height: 60,
              child: TextButton(
                style: TextButton.styleFrom(primary: primaryDefault),
                onPressed: () {
                  setState(() {
                    currentDrawer = 2;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/menu_borderSide.svg',
                        color: currentDrawer == 2
                            ? primaryDefault
                            : grayscaleWhite),
                    SizedBox(width: 36),
                    SvgPicture.asset(
                      "assets/icons/menu2_graph.svg",
                      color: currentDrawer == 2
                          ? primaryDefault
                          : grayscaleAverage,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "My exchanges",
                      style: TextStyle(
                        color: currentDrawer == 2
                            ? grayscaleDark
                            : grayscaleAverage,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 14),
            Container(
              height: 60,
              child: TextButton(
                style: TextButton.styleFrom(primary: primaryDefault),
                onPressed: () {
                  setState(() {
                    currentDrawer = 3;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/menu_borderSide.svg',
                        color: currentDrawer == 3
                            ? primaryDefault
                            : grayscaleWhite),
                    SizedBox(width: 36),
                    SvgPicture.asset(
                      "assets/icons/menu3_network.svg",
                      color: currentDrawer == 3
                          ? primaryDefault
                          : grayscaleAverage,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Partner network",
                      style: TextStyle(
                        color: currentDrawer == 3
                            ? grayscaleDark
                            : grayscaleAverage,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 14),
            Container(
              height: 60,
              child: TextButton(
                style: TextButton.styleFrom(primary: primaryDefault),
                onPressed: () {
                  setState(() {
                    currentDrawer = 4;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/menu_borderSide.svg',
                        color: currentDrawer == 4
                            ? primaryDefault
                            : grayscaleWhite),
                    SizedBox(width: 36),
                    SvgPicture.asset(
                      "assets/icons/menu4_book.svg",
                      color: currentDrawer == 4
                          ? primaryDefault
                          : grayscaleAverage,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Kadex academy",
                      style: TextStyle(
                        color: currentDrawer == 4
                            ? grayscaleDark
                            : grayscaleAverage,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 14),
            Center(child: SvgPicture.asset("assets/icons/menu_divider.svg")),
            SizedBox(height: 14),
            Container(
              // decoration: BoxDecoration(borderRadius: BorderRadius.zero),
              height: 60,
              child: TextButton(
                // style: ButtonStyle(
                //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //     RoundedRectangleBorder(
                //       borderRadius: BorderRadius.zero,
                //     ),
                //   ),
                // ),
                style: TextButton.styleFrom(primary: primaryDefault),
                onPressed: () {
                  setState(() {
                    currentDrawer = 5;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/menu_borderSide.svg',
                        color: currentDrawer == 5
                            ? primaryDefault
                            : grayscaleWhite),
                    SizedBox(width: 36),
                    SvgPicture.asset(
                      //   title: "Technical support",
                      //   svgSrc: "assets/icons/menu5_headset.svg",
                      "assets/icons/menu5_headset.svg",
                      color: currentDrawer == 5
                          ? primaryDefault
                          : grayscaleAverage,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Technical support",
                      style: TextStyle(
                        color: currentDrawer == 5
                            ? grayscaleDark
                            : grayscaleAverage,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 145),
              // color: primaryExtralight,
              height: 332,
              child: Column(
                children: [
                  Image.asset("assets/images/menu_usdt.png"),
                  SizedBox(height: 24),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onHover: (PointerEvent details) {
                      setState(() {
                        colorText = grayscaleAverage;
                      });
                    },
                    onExit: (PointerEvent details) {
                      setState(() {
                        colorText = grayscaleDark;
                      });
                    },
                    child: Text(
                      'Sell or buy USDT',
                      style: TextStyle(
                          color: colorText,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextButton(
                    onPressed: () {},
                    style: primaryLightButtonStyle,
                    // TextButton.styleFrom(
                    //   primary: primaryDefault,
                    //   shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.all(Radius.circular(20)),
                    //   ),
                    //   backgroundColor: primaryLight,
                    //   minimumSize: Size(200, 60),
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_telegram.svg",
                          height: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Go',
                          style: TextStyle(
                            color: grayscaleDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

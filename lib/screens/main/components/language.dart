import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kadex2/constants.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  var arrowUrl = "assets/icons/arrow_down.svg";
  var arrowColor = grayscaleAverage;
  var showLangTooltip = false;
  var hoverColor = grayscaleAverage;
  var hoverColor2 = grayscaleAverage;
  var hoverColor3 = grayscaleAverage;
  var selectedIndex = 0;
  var flagsUrl = [
    "assets/icons/flag_en.png",
    "assets/icons/flag_ru.png",
    "assets/icons/flag_ge.png"
  ];
  var langs = ['En', 'Ru', 'Ge'];
  // int _value = 1;
  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   width: 80,
        //   padding: EdgeInsets.all(0),
        //   child: DropdownButton(
        //     underline: SizedBox.shrink(),
        //     elevation: 1,
        //     icon: SvgPicture.asset(
        //       arrowUrl,
        //       color: arrowColor,
        //     ),
        //     value: _value,
        //     items: [
        //       DropdownMenuItem(
        //         value: 1,
        //         child: Container(
        //           child: Row(
        //             children: [
        //               Image.asset("assets/icons/flag_en.png", width: 24),
        //               SizedBox(width: 8),
        //               Text(
        //                 'En',
        //                 style: TextStyle(
        //                   color: selectedIndex == 0 ? grayscaleDark : hoverColor,
        //                   fontSize: 14,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       DropdownMenuItem(
        //         value: 2,
        //         child: Container(
        //           child: Row(
        //             children: [
        //               Image.asset("assets/icons/flag_ru.png", width: 24),
        //               SizedBox(width: 8),
        //               Text(
        //                 'Ru',
        //                 style: TextStyle(
        //                   color: selectedIndex == 0 ? grayscaleDark : hoverColor,
        //                   fontSize: 14,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //     onChanged: (value) {
        //       setState(() {
        //         _value = value;
        //       });
        //     },
        //   ),
        // );
        MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (PointerEvent details) {
        setState(() {
          arrowColor = grayscaleDarkmode;
        });
      },
      onExit: (PointerEvent details) {
        setState(() {
          arrowColor = grayscaleAverage;
        });
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            arrowColor = grayscaleAverage;
            // showLangTooltip = !showLangTooltip;
            if (showLangTooltip == true) {
              arrowUrl = "assets/icons/arrow_up.svg";
            } else {
              arrowUrl = "assets/icons/arrow_down.svg";
            }
          });
        },
        child: Column(
          children: [
            Container(
              width: 80,
              height: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(flagsUrl[selectedIndex]),
                  Text(
                    langs[selectedIndex],
                    style: TextStyle(
                      color: grayscaleDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SvgPicture.asset(
                    arrowUrl,
                    color: arrowColor,
                  ),
                ],
              ),
            ),
            // SizedBox(height: 8),
            showLangTooltip == false
                ? SizedBox.shrink()
                : Container(
                    width: 80,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: grayscaleWhite,
                    ),
                    child: Column(
                      children: [
                        MouseRegion(
                          onEnter: (PointerEvent details) {
                            setState(() {
                              hoverColor = grayscaleDark;
                            });
                          },
                          onExit: (PointerEvent details) {
                            setState(() {
                              hoverColor = grayscaleAverage;
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 0;
                                showLangTooltip = !showLangTooltip;
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset("assets/icons/flag_en.png",
                                      width: 24),
                                  SizedBox(width: 8),
                                  Text(
                                    'En',
                                    style: TextStyle(
                                      color: selectedIndex == 0
                                          ? grayscaleDark
                                          : hoverColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        MouseRegion(
                          onEnter: (PointerEvent details) {
                            setState(() {
                              hoverColor2 = grayscaleDark;
                            });
                          },
                          onExit: (PointerEvent details) {
                            setState(() {
                              hoverColor2 = grayscaleAverage;
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                                showLangTooltip = !showLangTooltip;
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset("assets/icons/flag_ru.png",
                                      width: 24),
                                  SizedBox(width: 8),
                                  Text(
                                    'Ru',
                                    style: TextStyle(
                                      color: selectedIndex == 1
                                          ? grayscaleDark
                                          : hoverColor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        MouseRegion(
                          onEnter: (PointerEvent details) {
                            setState(() {
                              hoverColor3 = grayscaleDark;
                            });
                          },
                          onExit: (PointerEvent details) {
                            setState(() {
                              hoverColor3 = grayscaleAverage;
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 2;
                                showLangTooltip = !showLangTooltip;
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset("assets/icons/flag_ge.png",
                                      width: 24),
                                  SizedBox(width: 8),
                                  Text(
                                    'Ge',
                                    style: TextStyle(
                                      color: selectedIndex == 2
                                          ? grayscaleDark
                                          : hoverColor3,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

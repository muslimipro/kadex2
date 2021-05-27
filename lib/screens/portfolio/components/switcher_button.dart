import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/constants.dart';

class SwitcherButton extends StatefulWidget {
  @override
  _SwitcherButtonState createState() => _SwitcherButtonState();
}

class _SwitcherButtonState extends State<SwitcherButton> {
  int swictherIndex = 0;
  int swictherHoveredIndex = -1;
  List<Alignment> switcherAlignment = [
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
  ];
  List<Text> switcherText = [
    Text(
      "Day",
      key: UniqueKey(),
      style: blockTextStyle.copyWith(color: primaryDefault),
    ),
    Text(
      "Week",
      key: UniqueKey(),
      style: blockTextStyle.copyWith(color: primaryDefault),
    ),
    Text(
      "Month",
      key: UniqueKey(),
      style: blockTextStyle.copyWith(color: primaryDefault),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderedBox,
      height: 60,
      padding: EdgeInsets.all(6),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      swictherHoveredIndex = 0;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      swictherHoveredIndex = -1;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        swictherIndex = 0;
                      });
                    },
                    child: Container(
                      height: 60,
                      color: grayscaleWhite,
                      child: Center(
                        child: Text(
                          'Day',
                          style: blockSubtitleStyle.copyWith(
                            color: swictherHoveredIndex == 0
                                ? primaryDefault
                                : grayscaleDarkmode,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/switcher_divider.svg"),
              Expanded(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      swictherHoveredIndex = 1;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      swictherHoveredIndex = -1;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        swictherIndex = 1;
                      });
                    },
                    child: Container(
                      height: 60,
                      color: grayscaleWhite,
                      child: Center(
                        child: Text(
                          'Week',
                          style: blockSubtitleStyle.copyWith(
                            color: swictherHoveredIndex == 1
                                ? primaryDefault
                                : grayscaleDarkmode,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/switcher_divider.svg"),
              Expanded(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      swictherHoveredIndex = 2;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      swictherHoveredIndex = -1;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        swictherIndex = 2;
                      });
                    },
                    child: Container(
                      height: 60,
                      color: grayscaleWhite,
                      child: Center(
                        child: Text(
                          'Month',
                          style: blockSubtitleStyle.copyWith(
                            color: swictherHoveredIndex == 2
                                ? primaryDefault
                                : grayscaleDarkmode,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedAlign(
            alignment: switcherAlignment[swictherIndex],
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: FractionallySizedBox(
              widthFactor: 0.33,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryLight,
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: switcherText[swictherIndex],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

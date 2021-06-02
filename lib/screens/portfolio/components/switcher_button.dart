import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/common/constants.dart';

class SwitcherButton extends StatefulWidget {
  final List<String> switcherTextString;

  SwitcherButton({
    this.switcherTextString,
  });

  @override
  _SwitcherButtonState createState() => _SwitcherButtonState();
}

class _SwitcherButtonState extends State<SwitcherButton> {
  int swictherIndex = 0;
  int swictherHoveredIndex = -1;
  int switcherLength;
  List<Alignment> switcherAlignment = [];
  List<Text> switcherText = [];
  List<Widget> backTextItems = [];

  @override
  void initState() {
    super.initState();
    switcherLength = widget.switcherTextString.length;
    double division = 2 / (switcherLength - 1);
    double posX = -1;
    for (int i = 0; i < switcherLength; i++) {
      switcherAlignment.add(Alignment(posX, 0.5));
      posX += division;
      switcherText.add(
        Text(
          widget.switcherTextString[i],
          key: UniqueKey(),
          style: blockTextStyle.copyWith(color: primaryDefault),
        ),
      );
      backTextItems.add(
        BackTextItem(
          name: widget.switcherTextString[i],
          onIndexChanged: () {
            setState(() {
              swictherIndex = i;
            });
          },
        ),
      );
      if (i < switcherLength - 1) {
        backTextItems.add(
          SvgPicture.asset("assets/icons/switcher_divider.svg"),
        );
      }
    }
  }

  void changeIndex(int index) {
    setState(() {
      swictherIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderedBox,
      height: 60,
      padding: EdgeInsets.all(6),
      child: Stack(
        children: [
          Row(
            children: backTextItems,
          ),
          AnimatedAlign(
            alignment: switcherAlignment[swictherIndex],
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: FractionallySizedBox(
              widthFactor: 1 / switcherLength - 0.01,
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

class BackTextItem extends StatefulWidget {
  final String name;
  final VoidCallback onIndexChanged;

  BackTextItem({
    this.name,
    this.onIndexChanged,
  });
  @override
  _BackTextItemState createState() => _BackTextItemState();
}

class _BackTextItemState extends State<BackTextItem> {
  int swictherHoveredIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            widget.onIndexChanged();
          },
          child: Container(
            height: 60,
            color: grayscaleWhite,
            child: Center(
              child: Text(
                widget.name,
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
    );
  }
}

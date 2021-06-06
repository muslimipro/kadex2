import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/common/constants.dart';

class HeaderBack extends StatefulWidget {
  final title;
  final backIndex;
  final ValueChanged<int> changeNavigationIndex;
  HeaderBack({this.title, this.backIndex, this.changeNavigationIndex});

  @override
  _HeaderBackState createState() => _HeaderBackState();
}

class _HeaderBackState extends State<HeaderBack> {
  bool backHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          backHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          backHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          widget.changeNavigationIndex(widget.backIndex);
        },
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/arrow_back.svg",
              color: backHovered ? grayscaleAverage : grayscaleDarkmode,
            ),
            SizedBox(width: 6),
            Text(
              widget.title,
              style: blockTitleStyle.copyWith(
                color: backHovered ? grayscaleDarkmode : grayscaleDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

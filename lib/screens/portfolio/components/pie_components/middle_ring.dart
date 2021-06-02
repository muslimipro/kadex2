import 'package:flutter/material.dart';
import 'package:kadex2/common/constants.dart';

class MiddleRing extends StatelessWidget {
  final num width;

  const MiddleRing({Key key, @required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: width,
      decoration: BoxDecoration(
        color: grayscaleWhite,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "i30",
          style: blockTextStyle.copyWith(fontSize: 32),
        ),
      ),
    );
  }
}

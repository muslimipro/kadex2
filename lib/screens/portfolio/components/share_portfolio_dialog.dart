import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kadex2/common/constants.dart';

class SharePortfolioDialog extends StatefulWidget {
  @override
  _SharePortfolioDialogState createState() => _SharePortfolioDialogState();
}

class _SharePortfolioDialogState extends State<SharePortfolioDialog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 0,
        child: Container(
          width: 720,
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('Share this with your social Community',
                        style: blockTitleStyle),
                  ),
                  SvgPicture.asset("assets/icons/cancel.svg"),
                ],
              ),
              SizedBox(height: 30),
              Container(
                height: 188,
                decoration: borderedBox,
                width: double.infinity,
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("assets/icons/facebook.svg"),
                    SvgPicture.asset("assets/icons/instagram.svg"),
                    SvgPicture.asset("assets/icons/telegram.svg"),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: borderedBox,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Or copy link',
                            style: footnoteRegular.copyWith(
                              color: grayscaleAverage,
                            ),
                          ),
                          Text(
                            'https://dribbble.com/shots/15064888',
                            style: blockSubtitleStyle.copyWith(
                              color: grayscaleDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset("assets/icons/copy.svg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

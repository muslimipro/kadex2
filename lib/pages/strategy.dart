import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/screens/portfolio/components/switcher_button.dart';

class SetupStrategy extends StatefulWidget {
  @override
  _SetupStrategyState createState() => _SetupStrategyState();
}

class _SetupStrategyState extends State<SetupStrategy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 524,
          width: double.infinity,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: grayscaleWhite,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StepCircle(number: '1'),
                  SizedBox(width: 20),
                  Text(
                    'Set up your rebalancing days',
                    style: blockSubtitleStyle.copyWith(
                      color: grayscaleDark,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: 42,
                    child: SvgPicture.asset('assets/icons/dashLine.svg'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SwitcherButton(
                      switcherTextString: [
                        '7 day',
                        '14 days',
                        '21 day',
                        '30 days',
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StepCircle(number: '2'),
                  SizedBox(width: 20),
                  Text(
                    'Choose your strategy',
                    style: blockSubtitleStyle.copyWith(
                      color: grayscaleDark,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: 42,
                    child: SvgPicture.asset('assets/icons/dashLine.svg'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SwitcherButton(
                      switcherTextString: [
                        'Even',
                        'WMA',
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(width: 62),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Text(
                          'Equal weighted distribution',
                          style: blockSubtitleStyle.copyWith(
                            color: grayscaleAverage,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Text(
                          'Average rolling distribution',
                          style: blockSubtitleStyle.copyWith(
                            color: grayscaleAverage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              TextButton(
                onPressed: () {},
                style: primaryDefaultButtonStyle.copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(Size(310, 60)),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: grayscaleWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/common/constants.dart';

class SellPortfolioDialog extends StatefulWidget {
  final double initialPercent;
  SellPortfolioDialog({this.initialPercent});
  @override
  _SellPortfolioDialogState createState() => _SellPortfolioDialogState();
}

class _SellPortfolioDialogState extends State<SellPortfolioDialog> {
  double _percent;
  @override
  void initState() {
    super.initState();
    _percent = widget.initialPercent;
  }

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
          // height: 559,
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sell Portfolio', style: blockTitleStyle),
                  SvgPicture.asset("assets/icons/cancel.svg"),
                ],
              ),
              SizedBox(height: 30),
              DottedBorder(
                color: otherError,
                dashPattern: [6, 6],
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                padding: EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    // height: 120,
                    padding: EdgeInsets.all(30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/warning.svg",
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            'After activating the Sell Portfolio feature, we recommend that you immediately freeze or withdraw your USDT from your Binance wallet before the next rebalancing begins. Otherwise, the fixed amount will be distributed back across the portfolio.',
                            style: footnoteRegular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                // height: 188,
                decoration: borderedBox,
                width: double.infinity,
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 500,
                      child: Text(
                        'You launch the "Sell Portfolio" function. Choose how much you want to convert to USDT.',
                        style: blockSubtitleStyle,
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      children: [
                        Text(
                          '5%',
                          style: blockTextStyle.copyWith(
                            color: grayscaleDarkmode,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              // activeTrackColor: LinearGradient(colors: colors),//Colors.red[700],
                              // inactiveTrackColor: Colors.red[100],
                              // trackShape: RoundedRectSliderTrackShape(),
                              trackShape: GradientRectSliderTrackShape(
                                  gradient: gradient, darkenInactive: true),
                              trackHeight: 6.0,
                              thumbColor: grayscaleWhite,
                              thumbShape: CircleThumbShape(thumbRadius: 15),
                              tickMarkShape: RoundSliderTickMarkShape(),
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              overlayColor: otherError.withAlpha(32),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 20.0),
                              valueIndicatorColor: Colors.transparent,
                              valueIndicatorTextStyle:
                                  blockTextStyle.copyWith(color: otherError),
                            ),
                            child: Slider(
                              value: _percent,
                              min: 5,
                              max: 100,
                              divisions: 19,
                              onChanged: (value) {
                                setState(() {
                                  _percent = value;
                                });
                              },
                              label: ' ' + _percent.round().toString() + '%',
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '100%',
                          style: blockTextStyle.copyWith(
                            color: grayscaleDarkmode,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Sell');
                      },
                      style: primaryDefaultButtonStyle,
                      child: Text(
                        "Sell",
                        style: blockTextStyle.copyWith(color: grayscaleWhite),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                      style: primaryLightButtonStyle,
                      child: Text(
                        "Cancel",
                        style: blockTextStyle.copyWith(color: grayscaleWhite),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleThumbShape extends SliderComponentShape {
  final double thumbRadius;

  const CircleThumbShape({
    this.thumbRadius = 6.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      TextPainter labelPainter,
      RenderBox parentBox,
      SliderThemeData sliderTheme,
      TextDirection textDirection,
      double value,
      double textScaleFactor,
      Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..color = grayscaleWhite
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = otherError
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}

LinearGradient gradient = LinearGradient(colors: <Color>[
  otherAzure,
  otherBlue,
  primaryDefault,
  secondaryDefault,
  otherError,
]);

class GradientRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  final LinearGradient gradient;
  final bool darkenInactive;
  const GradientRectSliderTrackShape(
      {this.gradient:
          const LinearGradient(colors: [Colors.lightBlue, Colors.blue]),
      this.darkenInactive: true});

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    @required RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    @required Animation<double> enableAnimation,
    @required TextDirection textDirection,
    @required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 0,
  }) {
    assert(context != null);
    assert(offset != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(enableAnimation != null);
    assert(textDirection != null);
    assert(thumbCenter != null);
    if (sliderTheme.trackHeight <= 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = darkenInactive
        ? ColorTween(
            begin: sliderTheme.disabledInactiveTrackColor,
            end: sliderTheme.inactiveTrackColor)
        : activeTrackColorTween;
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation);
    final Paint inactivePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = inactiveTrackColorTween.evaluate(enableAnimation);
    Paint leftTrackPaint;
    Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }
    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular(trackRect.height / 2 + 1);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}

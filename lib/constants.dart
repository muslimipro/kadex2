import 'package:flutter/material.dart';

// const primaryColor = Color(0xFF773EF5);
// const secondaryColor = Color(0xFF773EF5); //Color(0xFF2A2D3E);
// const bgColor = Color(0xFF773EF5); // Color(0xFF212332);

const grayscaleDark = Color(0xFF14142B);
const grayscaleDarkmode = Color(0xFF6E7191);
const grayscaleAverage = Color(0xFFA0A3BD);
const grayscaleLight = Color(0xFFEFF0F6);
const grayscaleExtralight = Color(0xFFF7F7FC);
const grayscaleWhite = Color(0xFFFFFFFF);

const primaryDefault = Color(0xFF773EF5);
const primaryDark = Color(0xFF4F16CD);
const primaryLight = Color(0xFFE4DCFF);
const primaryExtralight = Color(0xFFF5F1FD);

const secondaryDefault = Color(0xFFDC4FFF);
const secondaryLight = Color(0xFFF6D1FF);

const otherSuccess = Color(0xFF3DCAB0);
const otherError = Color(0xFFFF4F79);
const otherAzure = Color(0xFF2CC7DC);
const otherBlue = Color(0xFF3177FF);

const defaultPadding = 16.0;

double buttonWidth = 175.0;

final ButtonStyle primaryLightButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(primaryLight),
  minimumSize: MaterialStateProperty.all<Size>(Size(buttonWidth, 60)),
  overlayColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) return primaryExtralight;
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) return primaryLight;
      return null;
    },
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      // side: BorderSide(color: Colors.red),
    ),
  ),
);
final ButtonStyle primaryDefaultButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(primaryDefault),
  minimumSize: MaterialStateProperty.all<Size>(Size(buttonWidth, 60)),
  overlayColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) return primaryDark;
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) return primaryDefault;
      return null;
    },
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);

final ButtonStyle whiteButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(grayscaleWhite),
  minimumSize: MaterialStateProperty.all<Size>(Size(buttonWidth, 60)),
  overlayColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) return grayscaleExtralight;
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) return grayscaleWhite;
      return null;
    },
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);

final BoxShadow boxShadow = BoxShadow(
  color: grayscaleAverage.withOpacity(0.22),
  blurRadius: 10,
  offset: Offset(0, 2),
);

final TextStyle blockTitleStyle = TextStyle(
  color: grayscaleDark,
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

final BoxDecoration borderedBox = BoxDecoration(
  border: Border.all(
    width: 1,
    color: grayscaleLight,
  ),
  borderRadius: BorderRadius.circular(20),
);

TextStyle blockTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: grayscaleDark,
);
TextStyle blockSubtitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: grayscaleDarkmode,
);

class PieDot extends StatelessWidget {
  final Color color;
  final String name;

  PieDot({
    @required this.name,
    this.color = grayscaleAverage,
  });

  @override
  Widget build(BuildContext context) {
    final double diameter = 12;
    return Row(
      children: [
        Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10),
        Text(
          name,
          style: blockTextStyle.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}

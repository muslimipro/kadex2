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

const defaultPadding = 16.0;

double buttonWidth = 195.0;

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

import 'package:flutter/material.dart';
import 'package:kadex2/screens/main/components/language.dart';
import 'package:kadex2/screens/main/components/profile.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Language(),
        SizedBox(width: 24),
        Profile(),
      ],
    );
  }
}

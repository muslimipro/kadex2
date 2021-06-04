import 'package:flutter/material.dart';
import 'package:kadex2/screens/main/components/language.dart';
import 'package:kadex2/screens/main/components/profile.dart';

class Header extends StatelessWidget {
  final List<Widget> actions;
  final VoidCallback onSignOut;
  Header({this.actions, this.onSignOut});
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: actions,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Language(),
            SizedBox(width: 24),
            Profile(onSignOut: onSignOut),
          ],
        ),
      ],
    );
  }
}

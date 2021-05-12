import 'package:flutter/material.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/main/components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: 280,
              child: SideMenu(),
            ),
            Expanded(
              child: Container(color: grayscaleLight),
            ),
          ],
        ),
      ),
    );
  }
}

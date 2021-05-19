import 'package:flutter/material.dart';
import 'package:kadex2/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Kaylynn Culhane",
          style: TextStyle(
            color: grayscaleDarkmode,
            fontSize: 18,
          ),
        ),
        SizedBox(width: 14),
        MouseRegion(
          onEnter: (PointerEvent details) {
            setState(() {
              hovered = true;
            });
          },
          onExit: (PointerEvent details) {
            setState(() {
              hovered = false;
            });
          },
          child: Container(
            child: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              // child: Text('AH'),
              backgroundImage: AssetImage("assets/images/profile_img.jpeg"),
              radius: 30,
            ),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: new Border.all(
                color: hovered ? primaryDefault : grayscaleLight,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

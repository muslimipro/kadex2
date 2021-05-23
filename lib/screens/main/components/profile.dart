import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kadex2/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool hovered = false;

  LayerLink _layerLink = LayerLink();
  OverlayEntry overlayEntry;
  var showLangTooltip = false;

  showLangOverlay(BuildContext context) {
    RenderBox renderBox = context.findRenderObject();
    Offset offset = renderBox.localToGlobal(Offset.zero);
    Size size = renderBox.size;
    OverlayState overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + size.height + 8,
        child: CompositedTransformFollower(
          link: this._layerLink,
          offset: Offset(-(118 - size.height), size.height + 8),
          child: Container(
            width: 118,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: grayscaleWhite,
              boxShadow: [boxShadow],
            ),
            child: Column(
              children: [
                TextButton(
                  style: whiteButtonStyle,
                  onPressed: () {},
                  child: Text('Settings'),
                ),
                TextButton(
                  style: whiteButtonStyle,
                  onPressed: () {},
                  child: Text('Log out'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    overlayState.insert(overlayEntry);
  }

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
          cursor: SystemMouseCursors.click,
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
          child: GestureDetector(
            onTap: () {
              setState(() {
                showLangTooltip = !showLangTooltip;
                if (showLangTooltip == true) {
                  showLangOverlay(context);
                } else {
                  overlayEntry.remove();
                }
              });
            },
            child: CompositedTransformTarget(
              link: this._layerLink,
              child: Container(
                child: CircleAvatar(
                  backgroundColor: grayscaleWhite,
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
          ),
        ),
      ],
    );
  }
}

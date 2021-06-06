import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/common/constants.dart';

class Input extends StatefulWidget {
  final TextEditingController inputController;
  final FocusNode inputFocusNode;
  final bool inputFocused;
  final VoidCallback onFocus;
  final String hint;
  Input({
    this.inputController,
    this.inputFocusNode,
    this.inputFocused,
    this.onFocus,
    this.hint,
  });
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      controller: widget.inputController,
      onTap: () {
        widget.onFocus();
      },
      focusNode: widget.inputFocusNode,
      cursorColor: primaryDefault,
      style: blockTextStyle.copyWith(
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor:
            widget.inputFocused == true ? grayscaleOffWhite : grayscaleWhite,
        hoverColor: grayscaleOffWhite,
        labelText: widget.hint,
        labelStyle: TextStyle(color: grayscaleAverage),
        hintText: widget.inputFocused == true ? '' : widget.hint,
        hintStyle: TextStyle(color: grayscaleAverage),
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 24),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: grayscaleLight),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryLight),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        prefixIcon: SizedBox(width: 24),
        suffixIcon: Row(
          children: [
            SizedBox(width: 18),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: SvgPicture.asset(
                  obscure
                      ? "assets/icons/closed_eye.svg"
                      : "assets/icons/opened_eye.svg",
                  color: widget.inputFocused == true
                      ? primaryDefault
                      : grayscaleAverage,
                ),
              ),
            ),
            SizedBox(width: 18),
          ],
        ),
        suffixIconConstraints: BoxConstraints.tight(Size(70, 24)),
      ),
    );
  }
}

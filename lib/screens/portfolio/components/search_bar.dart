import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/common/constants.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final bool searchFocused;
  final VoidCallback onFocus;
  final String hint;
  SearchBar({
    this.searchController,
    this.searchFocusNode,
    this.searchFocused,
    this.onFocus,
    this.hint,
  });
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchController,
      onTap: () {
        widget.onFocus();
      },
      focusNode: widget.searchFocusNode,
      cursorColor: primaryDefault,
      style: blockTextStyle.copyWith(
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor:
            widget.searchFocused == true ? grayscaleOffWhite : grayscaleWhite,
        hoverColor: grayscaleOffWhite,
        hintText: widget.hint,
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
        prefixIcon: Row(
          children: [
            SizedBox(width: 30),
            SvgPicture.asset(
              "assets/icons/search.svg",
              color: widget.searchFocused == true
                  ? primaryDefault
                  : grayscaleAverage,
            ),
            SizedBox(width: 16),
          ],
        ),
        prefixIconConstraints: BoxConstraints.tight(Size(70, 24)),
      ),
    );
  }
}

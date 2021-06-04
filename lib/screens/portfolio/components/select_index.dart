import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/models/portfolio_model.dart';

class SelectIndex extends StatefulWidget {
  final PortfolioModel portfolio;
  SelectIndex({this.portfolio});
  @override
  _SelectIndexState createState() => _SelectIndexState();
}

class _SelectIndexState extends State<SelectIndex> {
  LayerLink _layerLink = LayerLink();
  OverlayEntry overlayEntry;
  var showTooltip = false;
  var selectedIndex;
  var indexName = ['i30', 'i50', 'i100', 'iCustom'];
  var arrowUrl = "assets/icons/index_arrow_down.svg";

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.portfolio.indexNumber;
  }

  showOverlay(BuildContext context, PortfolioModel portfolio) {
    RenderBox renderBox = context.findRenderObject();
    Offset offset = renderBox.localToGlobal(Offset.zero);
    Size size = renderBox.size;
    OverlayState overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + size.height + 8,
        child: CompositedTransformFollower(
          link: this._layerLink,
          offset: Offset(0, size.height + 8),
          child: Container(
            width: renderBox.size.width,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: grayscaleWhite,
              boxShadow: [boxShadow],
            ),
            child: Column(
              children: [
                TextButton(
                  style: whiteButtonStyle.copyWith(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(0.0)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        selectedIndex == 0
                            ? primaryExtralight
                            : grayscaleWhite),
                  ),
                  onPressed: () {
                    overlayEntry.remove();
                    setState(() {
                      selectedIndex = 0;
                      portfolio.changeIndex("i30");
                      showTooltip = !showTooltip;
                      if (showTooltip == true) {
                        arrowUrl = "assets/icons/index_arrow_up.svg";
                      } else {
                        arrowUrl = "assets/icons/index_arrow_down.svg";
                      }
                    });
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 18),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            'i30',
                            style: TextStyle(
                                fontSize: 18,
                                color: grayscaleDark,
                                fontWeight: selectedIndex == 0
                                    ? FontWeight.w600
                                    : FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                    ],
                  ),
                ),
                TextButton(
                  style: whiteButtonStyle.copyWith(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(0.0)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        selectedIndex == 1
                            ? primaryExtralight
                            : grayscaleWhite),
                  ),
                  onPressed: () {
                    overlayEntry.remove();
                    setState(() {
                      selectedIndex = 1;
                      portfolio.changeIndex("i50");
                      showTooltip = !showTooltip;
                      if (showTooltip == true) {
                        arrowUrl = "assets/icons/index_arrow_up.svg";
                      } else {
                        arrowUrl = "assets/icons/index_arrow_down.svg";
                      }
                    });
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 18),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            'i50',
                            style: TextStyle(
                                fontSize: 18,
                                color: grayscaleDark,
                                fontWeight: selectedIndex == 1
                                    ? FontWeight.w600
                                    : FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                    ],
                  ),
                ),
                TextButton(
                  style: whiteButtonStyle.copyWith(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(0.0)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        selectedIndex == 2
                            ? primaryExtralight
                            : grayscaleWhite),
                  ),
                  onPressed: () {
                    overlayEntry.remove();
                    setState(() {
                      selectedIndex = 2;
                      portfolio.changeIndex("i100");
                      showTooltip = !showTooltip;
                      if (showTooltip == true) {
                        arrowUrl = "assets/icons/index_arrow_up.svg";
                      } else {
                        arrowUrl = "assets/icons/index_arrow_down.svg";
                      }
                    });
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 18),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            'i100',
                            style: TextStyle(
                                fontSize: 18,
                                color: grayscaleDark,
                                fontWeight: selectedIndex == 2
                                    ? FontWeight.w600
                                    : FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                    ],
                  ),
                ),
                TextButton(
                  style: whiteButtonStyle.copyWith(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(0.0)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        selectedIndex == 3
                            ? primaryExtralight
                            : grayscaleWhite),
                  ),
                  onPressed: () {
                    overlayEntry.remove();
                    setState(() {
                      selectedIndex = 3;
                      portfolio.changeIndex("iCustom");
                      showTooltip = !showTooltip;
                      if (showTooltip == true) {
                        arrowUrl = "assets/icons/index_arrow_up.svg";
                      } else {
                        arrowUrl = "assets/icons/index_arrow_down.svg";
                      }
                    });
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 18),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            'iCustom',
                            style: TextStyle(
                                fontSize: 18,
                                color: grayscaleDark,
                                fontWeight: selectedIndex == 3
                                    ? FontWeight.w600
                                    : FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                    ],
                  ),
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
    return CompositedTransformTarget(
      link: this._layerLink,
      child: TextButton(
        onPressed: () {
          setState(() {
            showTooltip = !showTooltip;
            if (showTooltip == true) {
              arrowUrl = "assets/icons/index_arrow_up.svg";
              showOverlay(context, widget.portfolio);
            } else {
              arrowUrl = "assets/icons/index_arrow_down.svg";
              overlayEntry.remove();
            }
          });
        },
        style: whiteButtonStyle,
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.portfolio.indexName,
                style: TextStyle(
                  color: grayscaleDark,
                  fontSize: 18,
                ),
              ),
              SvgPicture.asset(
                arrowUrl,
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/screens/main/components/header.dart';
import 'package:kadex2/widgets/responsive.dart';

class AdaptiveScaffoldDestination {
  final String title;
  final String iconUrl;

  const AdaptiveScaffoldDestination({
    @required this.title,
    @required this.iconUrl,
  });
}

class AdaptiveScaffold extends StatefulWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget body;
  final int currentIndex;
  final List<AdaptiveScaffoldDestination> destinations;
  final ValueChanged<int> onNavigationIndexChange;
  final VoidCallback onSignOut;
  final ScrollController scrollController;

  AdaptiveScaffold({
    this.title,
    this.body,
    this.actions = const [],
    @required this.currentIndex,
    @required this.destinations,
    this.onNavigationIndexChange,
    this.onSignOut,
    this.scrollController,
  });

  @override
  _AdaptiveScaffoldState createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  Color sellTextColor = grayscaleDark;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return Row(
        children: [
          Container(
            width: 250,
            child: Drawer(
              elevation: 0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 38, 0, 38),
                      child: SvgPicture.asset(
                        "assets/images/logo.svg",
                        height: 60,
                      ),
                    ),
                    for (int i = 0; i < widget.destinations.length; i++)
                      Column(
                        children: [
                          if (i == widget.destinations.length - 1)
                            Column(
                              children: [
                                Center(
                                  child: SvgPicture.asset(
                                      "assets/icons/menu_divider.svg"),
                                ),
                                SizedBox(height: 14)
                              ],
                            ),
                          Container(
                            height: 60,
                            child: TextButton(
                              style:
                                  TextButton.styleFrom(primary: primaryDefault),
                              onPressed: () => _destinationTapped(i),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/menu_borderSide.svg',
                                    color: widget.currentIndex == i
                                        ? primaryDefault
                                        : grayscaleWhite,
                                  ),
                                  SizedBox(width: 36),
                                  SvgPicture.asset(
                                    widget.destinations[i].iconUrl,
                                    color: widget.currentIndex == i
                                        ? primaryDefault
                                        : grayscaleAverage,
                                    height: 24,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.destinations[i].title,
                                    style: TextStyle(
                                      color: widget.currentIndex == i
                                          ? grayscaleDark
                                          : grayscaleAverage,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (i < widget.destinations.length - 1)
                            SizedBox(height: 14),
                        ],
                      ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 40, right: 40, bottom: 40, top: 145),
                      height: 332,
                      child: Column(
                        children: [
                          Image.asset("assets/images/menu_usdt.png"),
                          SizedBox(height: 24),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onHover: (PointerEvent details) {
                              setState(() {
                                sellTextColor = grayscaleAverage;
                              });
                            },
                            onExit: (PointerEvent details) {
                              setState(() {
                                sellTextColor = grayscaleDark;
                              });
                            },
                            child: Text(
                              'Sell or buy USDT',
                              style: TextStyle(
                                  color: sellTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 24),
                          TextButton(
                            onPressed: () {},
                            style: primaryLightButtonStyle,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_telegram.svg",
                                  height: 20,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Go',
                                  style: TextStyle(
                                    color: grayscaleDark,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Scaffold(
              body: SingleChildScrollView(
                controller: widget.scrollController,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(
                        actions: widget.actions,
                        onSignOut: widget.onSignOut,
                      ),
                      SizedBox(height: 40),
                      widget.body,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    // if (_isMediumScreen(context)) {
    return Row(
      children: [
        if (Responsive.isTablet(context))
          NavigationRail(
            leading: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: SvgPicture.asset(
                "assets/images/logo.svg",
                height: 32,
              ),
            ),
            destinations: [
              ...widget.destinations.map(
                (d) => NavigationRailDestination(
                  icon: SvgPicture.asset(
                    d.iconUrl,
                    color: widget.currentIndex == widget.destinations.indexOf(d)
                        ? primaryDefault
                        : grayscaleAverage,
                    height: 24,
                  ), //Icon(d.icon),
                  label: Text(d.title),
                ),
              ),
            ],
            // trailing: TextButton(
            //   onPressed: () {},
            //   style: primaryLightButtonStyle.copyWith(
            //     minimumSize: MaterialStateProperty.all<Size>(Size(60, 60)),
            //   ),
            //   child: SvgPicture.asset(
            //     "assets/icons/menu_telegram.svg",
            //     height: 24,
            //   ),
            // ),
            selectedIndex: widget.currentIndex < 5 ? widget.currentIndex : 0,
            onDestinationSelected: widget.onNavigationIndexChange ?? (_) {},
          ),
        Expanded(
          child: Scaffold(
            body: SingleChildScrollView(
              controller: widget.scrollController,
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      actions: widget.actions,
                      onSignOut: widget.onSignOut,
                    ),
                    SizedBox(height: 40),
                    widget.body,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
    // }
    // return Container();
  }

  void _destinationTapped(int destinationIndex) {
    if (destinationIndex != widget.currentIndex) {
      widget.onNavigationIndexChange(destinationIndex);
    }
  }
}

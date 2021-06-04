import 'package:flutter/material.dart';
import 'package:kadex2/pages/portfolio.dart';
import 'package:kadex2/widgets/adaptive_scaffold.dart';
import 'package:kadex2/widgets/control_buttons.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onSignOut;

  HomePage({
    @required this.onSignOut,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  List<Widget> _actions = [ControlButtons()];

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: Text('Dashboard App'),
      actions: _actions,
      currentIndex: _pageIndex,
      destinations: [
        AdaptiveScaffoldDestination(
          title: 'Smart Portfolio',
          iconUrl: "assets/icons/menu1_suitcase.svg",
        ),
        AdaptiveScaffoldDestination(
          title: 'My exchanges',
          iconUrl: "assets/icons/menu2_graph.svg",
        ),
        AdaptiveScaffoldDestination(
          title: 'Partner network',
          iconUrl: "assets/icons/menu3_network.svg",
        ),
        AdaptiveScaffoldDestination(
          title: 'Kadex academy',
          iconUrl: "assets/icons/menu4_book.svg",
        ),
        AdaptiveScaffoldDestination(
          title: 'Technical support',
          iconUrl: "assets/icons/menu5_headset.svg",
        ),
      ],
      body: _pageAtIndex(_pageIndex),
      onNavigationIndexChange: (newIndex) {
        setState(() {
          _pageIndex = newIndex;
        });
      },
      onActionsChange: (newActions) {
        setState(() {
          _actions = newActions;
        });
      },
      onSignOut: () {
        _handleSignOut();
      },
    );
  }

  Future<void> _handleSignOut() async {
    // var shouldSignOut = await showDialog<bool>(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text('Are you sure you want to sign out?'),
    //     actions: [
    //       TextButton(
    //         child: Text('No'),
    //         onPressed: () {
    //           Navigator.of(context).pop(false);
    //         },
    //       ),
    //       TextButton(
    //         child: Text('Yes'),
    //         onPressed: () {
    //           Navigator.of(context).pop(true);
    //         },
    //       ),
    //     ],
    //   ),
    // );

    // if (!shouldSignOut) {
    //   return;
    // }

    widget.onSignOut();
  }

  static Widget _pageAtIndex(int index) {
    if (index == 0) {
      return PortfolioPage(); // DashboardPage();
    }
    if (index == 1) {
      return Center(child: Text('My exchanges page')); // DashboardPage();
    }
    if (index == 2) {
      return Center(child: Text('Partner network page')); // DashboardPage();
    }
    if (index == 3) {
      return Center(child: Text('Kadex academy page')); // DashboardPage();
    }

    return Center(child: Text('Technical support page'));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kadex2/pages/customize.dart';
import 'package:kadex2/pages/exchanges.dart';
import 'package:kadex2/pages/portfolio.dart';
import 'package:kadex2/pages/rebalance.dart';
import 'package:kadex2/pages/strategy.dart';
import 'package:kadex2/widgets/adaptive_scaffold.dart';
import 'package:kadex2/widgets/control_buttons.dart';
import 'package:kadex2/widgets/header_back.dart';

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
  ScrollController _scrollController = ScrollController();

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
        changeNavigationIndex(newIndex);
      },
      onSignOut: () {
        _handleSignOut();
      },
      scrollController: _scrollController,
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

  void changeNavigationIndex(int destinationIndex) {
    if (destinationIndex != _pageIndex) {
      List<Widget> newActions = [];
      switch (destinationIndex) {
        case 0:
          newActions = [ControlButtons()];
          break;
        case 5:
          newActions = [
            HeaderBack(
              title: "Rebalancing days",
              backIndex: 0,
              changeNavigationIndex: (newIndex) {
                changeNavigationIndex(newIndex);
              },
            )
          ];
          break;
        case 6:
          newActions = [
            HeaderBack(
              title: "Set up your strategy",
              backIndex: 0,
              changeNavigationIndex: (newIndex) {
                changeNavigationIndex(newIndex);
              },
            )
          ];
          break;
        case 7:
          newActions = [
            HeaderBack(
              title: "Customize coin list",
              backIndex: 0,
              changeNavigationIndex: (newIndex) {
                changeNavigationIndex(newIndex);
              },
            )
          ];
          break;
        default:
      }
      _scrollController.animateTo(0,
          duration: Duration(milliseconds: 500), curve: Curves.easeOutBack);
      setState(() {
        _pageIndex = destinationIndex;
        _actions = newActions;
      });
    }
  }

  Widget _pageAtIndex(int index) {
    if (index == 0) {
      return PortfolioPage(
        onDestinationChange: (destinationIndex) {
          changeNavigationIndex(destinationIndex);
        },
      );
    }
    if (index == 1) {
      return ExchangesPage();
    }
    if (index == 2) {
      return Center(child: Text('Partner network page')); // DashboardPage();
    }
    if (index == 3) {
      return Center(child: Text('Kadex academy page')); // DashboardPage();
    }

    if (index == 4) {
      return Center(child: Text('Technical support page')); // DashboardPage();
    }

    if (index == 5) return RebalanceSettings();
    if (index == 6) return SetupStrategy();
    if (index == 7) return CustomizeCoins();
    return Center(child: Text('Default page'));
  }
}

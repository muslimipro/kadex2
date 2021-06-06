import 'package:flutter/material.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/screens/portfolio/components/coin_list_block.dart';
import 'package:kadex2/screens/portfolio/components/history_block.dart';
import 'package:kadex2/screens/portfolio/components/orders_block.dart';
import 'package:kadex2/screens/portfolio/components/portfolio_block.dart';
import 'package:kadex2/screens/portfolio/components/top_coins_block.dart';
import 'package:kadex2/widgets/responsive.dart';

class PortfolioPage extends StatefulWidget {
  final ValueChanged<int> onDestinationChange;

  PortfolioPage({this.onDestinationChange});
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  bool _inProgress;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 300)).then((result) {
      if (!mounted) return;
      setState(() {
        _inProgress = false;
      });
    });

    _inProgress = true;
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   setState(() {
    //     _inProgress = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return _inProgress
        ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primaryDefault),
            ),
          )
        : Column(
            children: [
              Row(
                children: [
                  PortfolioBlock(),
                  if (!Responsive.isMobile(context)) SizedBox(width: 30),
                  if (!Responsive.isMobile(context)) HistoryBlock(),
                ],
              ),
              if (Responsive.isMobile(context)) SizedBox(height: 24),
              if (Responsive.isMobile(context)) Row(children: [HistoryBlock()]),
              Responsive.isMobile(context)
                  ? SizedBox(height: 24)
                  : SizedBox(height: 40),
              Row(
                children: [
                  TopCoinsBlock(
                      onDestinationChange: widget.onDestinationChange),
                  if (!Responsive.isMobile(context)) SizedBox(width: 30),
                  if (!Responsive.isMobile(context))
                    CoinListBlock(
                        onDestinationChange: widget.onDestinationChange),
                ],
              ),
              if (Responsive.isMobile(context)) SizedBox(height: 24),
              if (Responsive.isMobile(context))
                Row(children: [
                  CoinListBlock(onDestinationChange: widget.onDestinationChange)
                ]),
              Responsive.isMobile(context)
                  ? SizedBox(height: 24)
                  : SizedBox(height: 40),
              Row(
                children: [
                  OrdersBlock(),
                ],
              ),
              SizedBox(height: 40),
            ],
          );
  }
}

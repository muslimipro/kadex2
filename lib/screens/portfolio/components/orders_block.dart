import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kadex2/common/constants.dart';

class OrdersBlock extends StatefulWidget {
  @override
  _OrdersBlockState createState() => _OrdersBlockState();
}

class _OrdersBlockState extends State<OrdersBlock> {
  int hovered = -1;
  List<bool> pressed = List<bool>.filled(10, false);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 30),
              Text("Order history", style: blockTitleStyle),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 792,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: grayscaleWhite,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Text('Date', style: blockSubtitleStyle)),
                      Expanded(
                          child: Text('Portfolio', style: blockSubtitleStyle)),
                      Expanded(
                          child:
                              Text('Trade Value', style: blockSubtitleStyle)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                pressed[index] = !pressed[index];
                              });
                            },
                            style: whiteButtonStyle.copyWith(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.zero),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: grayscaleLight,
                                ),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 24,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text('2021-03-19',
                                            style: blockTextStyle),
                                      ),
                                      Expanded(
                                        child: Text('\$639.93',
                                            style: blockTextStyle),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$135.49',
                                              style: blockTextStyle.copyWith(
                                                  color: primaryDefault),
                                            ),
                                            SvgPicture.asset(
                                              pressed[index]
                                                  ? "assets/icons/arrow_up.svg"
                                                  : "assets/icons/arrow_down.svg",
                                              width: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  !pressed[index]
                                      ? SizedBox.shrink()
                                      : Column(
                                          children: [
                                            SizedBox(height: 24),
                                            Divider(
                                                height: 1,
                                                color: grayscaleLight),
                                            SizedBox(height: 24),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    child: Text('From - To',
                                                        style:
                                                            blockSubtitleStyle)),
                                                Expanded(
                                                    child: Text('Operation',
                                                        style:
                                                            blockSubtitleStyle)),
                                                Expanded(
                                                    child: Text('Trade Value',
                                                        style:
                                                            blockSubtitleStyle)),
                                              ],
                                            ),
                                            // SizedBox(height: 24),
                                            Column(
                                              children: [
                                                OrderDayItem(),
                                                OrderDayItem(),
                                                OrderDayItem(),
                                                OrderDayItem(
                                                  operation: 'BOUGHT',
                                                ),
                                                OrderDayItem(),
                                              ],
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDayItem extends StatelessWidget {
  final String fromto;
  final String operation;
  final String coinValue;
  final String tradeValue;

  OrderDayItem({
    this.fromto = 'ETH - BTC',
    this.operation = 'SOLD',
    this.coinValue = '0.0940',
    this.tradeValue = '\$12.43',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Text(this.fromto, style: blockTextStyle)),
            Expanded(
                child: Row(
              children: [
                this.operation == 'SOLD'
                    ? SvgPicture.asset("assets/icons/subtract.svg")
                    : SvgPicture.asset("assets/icons/add.svg"),
                SizedBox(width: 16),
                Text(this.operation, style: blockSubtitleStyle),
                Text(' '),
                Text(this.coinValue, style: blockSubtitleStyle),
              ],
            )),
            Expanded(child: Text(this.tradeValue, style: blockTextStyle)),
          ],
        ),
      ],
    );
  }
}

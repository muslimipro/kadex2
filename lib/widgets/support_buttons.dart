import 'package:flutter/material.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/models/portfolio_model.dart';
import 'package:kadex2/widgets/ask_dialog.dart';
import 'package:kadex2/widgets/responsive.dart';
import 'package:provider/provider.dart';

class SupportButtons extends StatefulWidget {
  @override
  _SupportButtonsState createState() => _SupportButtonsState();
}

class _SupportButtonsState extends State<SupportButtons> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioModel>(
      builder: (context, portfolio, child) {
        return Expanded(
          child: Responsive.isMobile(context)
              ? Container()
              : Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextButton(
                        onPressed: () async {
                          await showDialog<String>(
                            context: context,
                            // barrierDismissible: false,
                            barrierColor: grayscaleDarkmode.withOpacity(0.3),
                            builder: (BuildContext context) {
                              return AskDialog();
                            },
                          ).then((answer) {
                            print(answer);
                          });
                        },
                        style: primaryDefaultButtonStyle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ask a Question',
                              style: TextStyle(
                                color: grayscaleWhite,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 4,
                      child: TextButton(
                        onPressed: () {},
                        style: primaryLightButtonStyle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Suggest improvement',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: primaryDefault,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
        );
      },
    );
  }
}

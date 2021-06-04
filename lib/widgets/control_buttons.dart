import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/models/portfolio_model.dart';
import 'package:kadex2/screens/portfolio/components/select_index.dart';
import 'package:provider/provider.dart';

class ControlButtons extends StatefulWidget {
  @override
  _ControlButtonsState createState() => _ControlButtonsState();
}

class _ControlButtonsState extends State<ControlButtons> {
  activatePressed(PortfolioModel portfolio) async {
    portfolio.changeActivateLoading(true);
    await Future.delayed(Duration(seconds: 2))
        .then((val) => portfolio.changeActivate());
  }

  recalculatePressed(PortfolioModel portfolio) async {
    portfolio.changeRecalculateLoading(true);
    await Future.delayed(Duration(seconds: 2))
        .then((val) => portfolio.changeRecalculate());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioModel>(
      builder: (context, portfolio, child) {
        return Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: portfolio.activateLoading
                      ? null
                      : () {
                          activatePressed(portfolio);
                        },
                  style: portfolio.activated
                      ? primaryLightButtonStyle
                      : primaryDefaultButtonStyle,
                  child: portfolio.activateLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                portfolio.activated
                                    ? primaryDefault
                                    : grayscaleWhite),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              portfolio.activated
                                  ? 'assets/icons/pause.svg'
                                  : 'assets/icons/start.svg',
                              height: 24,
                            ),
                            SizedBox(width: 4),
                            Text(
                              portfolio.activated ? 'Pause' : 'Start',
                              style: TextStyle(
                                color: portfolio.activated
                                    ? grayscaleDark
                                    : grayscaleWhite,
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
                child: Tooltip(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  message:
                      'If you have replenished/withdrawn\n your balance on the exchange, we\n recommend recalculating the amount\n and restarting the portfolio',
                  verticalOffset: 35,
                  height: 112,
                  textStyle: TextStyle(
                    color: grayscaleDark,
                    fontSize: 14,
                  ),
                  decoration: BoxDecoration(
                    color: grayscaleWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [boxShadow],
                  ),
                  child: TextButton(
                    onPressed: (portfolio.activated ||
                            portfolio.recalculateLoading ||
                            portfolio.activateLoading)
                        ? null
                        : () {
                            recalculatePressed(portfolio);
                          },
                    style: (portfolio.activated || portfolio.activateLoading)
                        ? whiteButtonStyle
                        : primaryLightButtonStyle,
                    child: portfolio.recalculateLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  primaryDefault),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Recalculate',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: (portfolio.activated ||
                                          portfolio.activateLoading)
                                      ? grayscaleAverage
                                      : primaryDefault,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(child: SelectIndex(portfolio: portfolio)),
              SizedBox(
                  width: MediaQuery.of(context).size.width < 1100 ? 20 : 100),
            ],
          ),
        );
      },
    );
  }
}

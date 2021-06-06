import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/widgets/input.dart';
import 'package:kadex2/widgets/responsive.dart';

class ExchangesPage extends StatefulWidget {
  @override
  _ExchangesPageState createState() => _ExchangesPageState();
}

class _ExchangesPageState extends State<ExchangesPage> {
  final inputController = TextEditingController();
  final inputFocusNode = FocusNode();
  bool inputFocused = false;
  final inputController2 = TextEditingController();
  final inputFocusNode2 = FocusNode();
  bool inputFocused2 = false;
  bool activated = false;

  void onInputFocused() {
    setState(() {
      inputFocused = true;
      inputFocused2 = false;
    });
  }

  void onInputFocused2() {
    setState(() {
      inputFocused = false;
      inputFocused2 = true;
    });
  }

  void onInputChanged() {}
  void onInputChanged2() {}

  @override
  void initState() {
    super.initState();
    inputController.addListener(onInputChanged);
    inputController2.addListener(onInputChanged2);
  }

  @override
  void dispose() {
    inputController.dispose();
    inputController2.dispose();
    super.dispose();
  }

  Widget buildQuestion(String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Text(
        text,
        style: footnoteSemibold.copyWith(
          color: primaryDefault,
        ),
      ),
    );
  }

  Widget buildQuestions() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              buildQuestion("Don't have a Binance account?"),
              Responsive.isDesktop(context)
                  ? SizedBox(width: 42)
                  : SizedBox(width: 10),
              if (!Responsive.isMobile(context))
                buildQuestion("How do I configure the API key?"),
            ],
          ),
          if (Responsive.isMobile(context)) SizedBox(height: 10),
          if (Responsive.isMobile(context))
            buildQuestion("How do I configure the API key?"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          inputFocused = false;
          inputFocused2 = false;
        });
      },
      child: Column(
        children: [
          Container(
            // height: 752,
            width: double.infinity,
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: grayscaleWhite,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: 294,
                      height: 230,
                      decoration: borderedBox.copyWith(
                        border: Border.all(
                          width: 1,
                          color: activated ? otherSuccess : grayscaleLight,
                        ),
                      ),
                      child: Center(
                        child: Image.asset("assets/images/binance.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                DottedBorder(
                  color: activated ? otherSuccess : otherError,
                  dashPattern: [6, 6],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20),
                  padding: EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      // height: 92,
                      padding: EdgeInsets.all(30),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            activated
                                ? "assets/icons/success.svg"
                                : "assets/icons/error.svg",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              'In order to use smart portfolio, you need to connect your exchange account',
                              style: blockSubtitleStyle.copyWith(
                                  color: grayscaleDark),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Input(
                  inputController: inputController,
                  inputFocusNode: inputFocusNode,
                  inputFocused: inputFocused,
                  onFocus: onInputFocused,
                  hint: 'Public key',
                ),
                SizedBox(height: 20),
                Input(
                  inputController: inputController2,
                  inputFocusNode: inputFocusNode2,
                  inputFocused: inputFocused2,
                  onFocus: onInputFocused2,
                  hint: 'The secret key',
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          activated = !activated;
                        });
                      },
                      style: primaryDefaultButtonStyle.copyWith(
                        minimumSize: MaterialStateProperty.all<Size>(Size(
                            Responsive.isDesktop(context) ? 310 : 250, 60)),
                      ),
                      child: Text(
                        "Activate key",
                        style: TextStyle(
                          color: grayscaleWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (!Responsive.isMobile(context)) buildQuestions(),
                  ],
                ),
                if (Responsive.isMobile(context)) SizedBox(height: 20),
                if (Responsive.isMobile(context)) buildQuestions(),
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

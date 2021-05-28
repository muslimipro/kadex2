import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/main/components/header.dart';
import 'package:lottie/lottie.dart';

class Newuser extends StatefulWidget {
  @override
  _NewuserState createState() => _NewuserState();
}

class _NewuserState extends State<Newuser> with TickerProviderStateMixin {
  AnimationController _i30jsoncontroller;
  AnimationController _i50jsoncontroller;
  AnimationController _i100jsoncontroller;
  AnimationController _iCustomjsoncontroller;
  int hoveredIndex = -1;

  @override
  void initState() {
    super.initState();
    _i30jsoncontroller = AnimationController(vsync: this);
    _i50jsoncontroller = AnimationController(vsync: this);
    _i100jsoncontroller = AnimationController(vsync: this);
    _iCustomjsoncontroller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _i30jsoncontroller.dispose();
    _i50jsoncontroller.dispose();
    _i100jsoncontroller.dispose();
    _iCustomjsoncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 40, 80, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text(
                    "Choose a portfolio",
                    style: blockTitleStyle,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (PointerEvent details) {
                        setState(() {
                          hoveredIndex = 0;
                        });
                        _i30jsoncontroller.duration = Duration(seconds: 6);
                        _i30jsoncontroller.repeat();
                      },
                      onExit: (PointerEvent details) {
                        setState(() {
                          hoveredIndex = -1;
                        });
                        _i30jsoncontroller.duration =
                            Duration(milliseconds: 1000);
                        _i30jsoncontroller.animateTo(0);
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/portfolio');
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            boxShadow: hoveredIndex == 0 ? [boxShadow] : [],
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: grayscaleWhite,
                            border: Border.all(
                              width: 1,
                              color: hoveredIndex == 0
                                  ? primaryLight
                                  : grayscaleWhite,
                            ),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Lottie.asset(
                                    'assets/animations/i30_json.json',
                                    controller: _i30jsoncontroller),
                              ),
                              SizedBox(height: 30),
                              Text(
                                'After activating the Sell Portfolio \nfeature, we recommend that you immediat',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: grayscaleDarkmode,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 46),
                  Expanded(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (PointerEvent details) {
                        setState(() {
                          hoveredIndex = 1;
                        });
                        _i50jsoncontroller.duration = Duration(seconds: 6);
                        _i50jsoncontroller.repeat();
                      },
                      onExit: (PointerEvent details) {
                        setState(() {
                          hoveredIndex = -1;
                        });
                        _i50jsoncontroller.duration =
                            Duration(milliseconds: 1000);
                        _i50jsoncontroller.animateTo(0);
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/portfolio');
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            boxShadow: hoveredIndex == 1 ? [boxShadow] : [],
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: grayscaleWhite,
                            border: Border.all(
                              width: 1,
                              color: hoveredIndex == 1
                                  ? primaryLight
                                  : grayscaleWhite,
                            ),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Lottie.asset(
                                    'assets/animations/i50_json.json',
                                    controller: _i50jsoncontroller),
                              ),
                              SizedBox(height: 30),
                              Text(
                                'After activating the Sell Portfolio \nfeature, we recommend that you immediat',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: grayscaleDarkmode,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (PointerEvent details) {
                        setState(() {
                          hoveredIndex = 2;
                        });
                        _i100jsoncontroller.duration = Duration(seconds: 6);
                        _i100jsoncontroller.repeat();
                      },
                      onExit: (PointerEvent details) {
                        setState(() {
                          hoveredIndex = -1;
                        });
                        _i100jsoncontroller.duration =
                            Duration(milliseconds: 1000);
                        _i100jsoncontroller.animateTo(0);
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/portfolio');
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            boxShadow: hoveredIndex == 2 ? [boxShadow] : [],
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: grayscaleWhite,
                            border: Border.all(
                              width: 1,
                              color: hoveredIndex == 2
                                  ? primaryLight
                                  : grayscaleWhite,
                            ),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Lottie.asset(
                                    'assets/animations/i100_json.json',
                                    controller: _i100jsoncontroller),
                              ),
                              SizedBox(height: 30),
                              Text(
                                'After activating the Sell Portfolio \nfeature, we recommend that you immediat',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: grayscaleDarkmode,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 46),
                  Expanded(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (PointerEvent details) {
                        setState(() {
                          hoveredIndex = 3;
                        });
                        _iCustomjsoncontroller.duration = Duration(seconds: 13);
                        _iCustomjsoncontroller.repeat();
                      },
                      onExit: (PointerEvent details) {
                        setState(() {
                          hoveredIndex = -1;
                        });
                        _iCustomjsoncontroller.duration =
                            Duration(milliseconds: 1000);
                        _iCustomjsoncontroller.animateTo(0);
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/portfolio');
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            boxShadow: hoveredIndex == 3 ? [boxShadow] : [],
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: grayscaleWhite,
                            border: Border.all(
                              width: 1,
                              color: hoveredIndex == 3
                                  ? primaryLight
                                  : grayscaleWhite,
                            ),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Lottie.asset(
                                    'assets/animations/iCustom_json.json',
                                    controller: _iCustomjsoncontroller),
                              ),
                              SizedBox(height: 30),
                              Text(
                                'After activating the Sell Portfolio \nfeature, we recommend that you immediat',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: grayscaleDarkmode,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

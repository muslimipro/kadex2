import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/main/components/header.dart';

class Newuser extends StatefulWidget {
  @override
  _NewuserState createState() => _NewuserState();
}

class _NewuserState extends State<Newuser> with TickerProviderStateMixin {
  GifController _i50gifController;
  GifController _i30gifController;
  GifController _i100gifController;
  GifController _iCustomgifController;
  String icustomUrl = "assets/images/icustom_GIF_bg.png";

  @override
  void initState() {
    super.initState();
    _i50gifController = GifController(vsync: this);
    _i30gifController = GifController(vsync: this);
    _i100gifController = GifController(vsync: this);
    _iCustomgifController = GifController(vsync: this);
  }

  @override
  void dispose() {
    _i50gifController.dispose();
    _i30gifController.dispose();
    _i100gifController.dispose();
    _iCustomgifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 40, 80, 0),
          child: Column(
            children: [
              Header(),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: grayscaleWhite,
                      ),
                      child: Column(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (PointerEvent details) {
                              // _i30gifController = GifController(vsync: this);
                              _i30gifController.repeat(
                                  min: 0,
                                  max: 300,
                                  period: Duration(seconds: 10));
                            },
                            onExit: (PointerEvent details) {
                              _i30gifController.animateTo(0,
                                  duration: Duration(milliseconds: 300));
                              // _i30gifController.dispose();
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/portfolio');
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: GifImage(
                                  controller: _i30gifController,
                                  image: AssetImage(
                                      "assets/gifs/i30_GIF (alternative).gif"),
                                ),
                                // Image(
                                //   image: AssetImage(
                                //       "assets/gifs/i30_GIF (alternative).gif"),
                                //   loadingBuilder: (context, child, progress) {
                                //     return progress == null
                                //         ? child
                                //         : SizedBox(
                                //             width: 20,
                                //             height: 20,
                                //             child: CircularProgressIndicator(
                                //               valueColor:
                                //                   new AlwaysStoppedAnimation<Color>(
                                //                       primaryDefault),
                                //             ),
                                //           );
                                //   },
                                // ),
                                // Image.asset(
                                //   "assets/gifs/i30_GIF (alternative).gif",
                                // ),
                              ),
                            ),
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
                  SizedBox(width: 46),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: grayscaleWhite,
                      ),
                      child: Column(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (PointerEvent details) {
                              // _i50gifController = GifController(vsync: this);
                              _i50gifController.repeat(
                                  min: 0,
                                  max: 300,
                                  period: Duration(seconds: 10));
                            },
                            onExit: (PointerEvent details) {
                              // _i50gifController.animateTo(0,
                              //     duration: Duration(milliseconds: 300));
                              _i50gifController.stop();
                              _i50gifController.reset();
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/portfolio');
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: GifImage(
                                  controller: _i50gifController,
                                  image: AssetImage(
                                    "assets/gifs/i50_GIF (alternative).gif",
                                  ),
                                ),
                              ),
                            ),
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
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: grayscaleWhite,
                      ),
                      child: Column(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (PointerEvent details) {
                              // _i100gifController = GifController(vsync: this);
                              _i100gifController.repeat(
                                  min: 0,
                                  max: 300,
                                  period: Duration(seconds: 10));
                            },
                            onExit: (PointerEvent details) {
                              // _i100gifController.animateTo(0,
                              //     duration: Duration(milliseconds: 300));
                              _i100gifController.stop();
                              _i100gifController.reset();
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/portfolio');
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: GifImage(
                                  controller: _i100gifController,
                                  image: AssetImage(
                                    "assets/gifs/i100_GIG (alternative).gi.gif",
                                  ),
                                ),
                              ),
                            ),
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
                  SizedBox(width: 46),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: grayscaleWhite,
                      ),
                      child: Column(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (PointerEvent details) {
                              setState(() {
                                icustomUrl = "assets/gifs/icustom_GIF.gif";
                              });

                              // _iCustomgifController = GifController(vsync: this);
                              // _iCustomgifController.repeat(
                              //     min: 0,
                              //     max: 650,
                              //     period: Duration(seconds: 22));
                            },
                            onExit: (PointerEvent details) {
                              setState(() {
                                icustomUrl = "assets/images/icustom_GIF_bg.png";
                              });

                              // _iCustomgifController.animateTo(0,
                              //     duration: Duration(milliseconds: 500));
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/portfolio');
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  icustomUrl,
                                ),
                              ),
                            ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

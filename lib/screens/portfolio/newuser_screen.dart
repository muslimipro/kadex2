import 'package:flutter/material.dart';
import 'package:kadex2/constants.dart';
import 'package:kadex2/screens/main/components/header.dart';

class Newuser extends StatelessWidget {
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image(
                              image: AssetImage(
                                  "assets/gifs/i30_GIF (alternative).gif"),
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  primaryDefault),
                                        ),
                                      );
                              },
                            ),
                            // Image.asset(
                            //   "assets/gifs/i30_GIF (alternative).gif",
                            // ),
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "assets/gifs/i50_GIF (alternative).gif",
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "assets/gifs/i100_GIG (alternative).gi.gif",
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "assets/gifs/icustom_GIF.gif",
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

// import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Presentation/colors.dart';
import 'package:nepalbhasafyp/Screens/Favorite%20Screen/favouritePage.dart';

import '../Models/Phrase.dart';

class LipiCard extends StatefulWidget {
  final String? lipiText;
  final String? devLipi;
  final String? engLipi;

  // final AudioElement? narration;
  const LipiCard({
    this.lipiText,
    this.devLipi,
    this.engLipi,
  });
  @override
  _LipiCardState createState() => _LipiCardState();
}

class _LipiCardState extends State<LipiCard> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            padding: EdgeInsets.all(10),
            width: 250,
            height: 165,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.CREAM,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.devLipi!,
                        style: TextStyle(
                            fontFamily: 'Nexa',
                            fontSize: 30,
                            color: AppColor.MAROON),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 40, 0),
                      alignment: Alignment.topLeft,
                      height: 30,
                      width: 2,
                      color: AppColor.MAROON,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.engLipi!,
                        style: TextStyle(
                            fontFamily: 'Nexa',
                            fontSize: 30,
                            color: AppColor.MAROON),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  alignment: Alignment.topLeft,
                  height: 2,
                  width: 175,
                  color: AppColor.MAROON,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: Image.network(widget.lipiText!,
                        width: 300, height: 80, fit: BoxFit.fitWidth),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

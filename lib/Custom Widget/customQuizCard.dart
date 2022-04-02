import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepalbhasafyp/Presentation/colors.dart';
import 'package:nepalbhasafyp/Screens/Favorite%20Screen/favouritePage.dart';

import '../Models/Phrase.dart';

class quizCard extends StatefulWidget {
  const quizCard({Key? key}) : super(key: key);
  @override
  _quizCardState createState() => _quizCardState();
}

class _quizCardState extends State<quizCard> {
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
                        "",
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
                        "",
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
               
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

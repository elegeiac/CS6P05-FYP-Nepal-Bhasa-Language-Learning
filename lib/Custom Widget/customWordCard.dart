import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Presentation/colors.dart';

class WordCard extends StatefulWidget {
  final String? engMeaning;
  final String? devTrans;
  final String? engTrans;
  final String? lipiTrans;
  // final AudioElement? narration;
  const WordCard({
    this.engMeaning,
    this.devTrans,
    this.engTrans,
    this.lipiTrans,
    // this.narration,
  });
  @override
  _WordCardState createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
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
            width: 350,
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.CREAM.withOpacity(0.7)),
              gradient: LinearGradient(colors: [
                Colors.white.withOpacity(0.8),
                Colors.white.withOpacity(0.4)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Column(
              children: [
                Container(
                  // margin: ,
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Meaning:',
                    style: TextStyle(
                        fontFamily: 'Cinzel',
                        fontSize: 16,
                        color: AppColor.MAROON),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'My name is Ushaan.',
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontSize: 18,
                        color: AppColor.MAROON),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Translation:',
                    style: TextStyle(
                        fontFamily: 'Cinzel',
                        fontSize: 16,
                        color: AppColor.MAROON),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'जि गु ना ',
                        style: TextStyle(
                            fontFamily: 'Nexa',
                            fontSize: 18,
                            color: AppColor.MAROON),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(220, 0, 0, 0),
                      child: Icon(
                        Icons.play_circle_filled_outlined,
                        color: AppColor.MAROON,
                        size: 37.0,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Ji Gu Naa ',
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontSize: 18,
                        color: AppColor.MAROON),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Nepal Lipi:',
                    style: TextStyle(
                        fontFamily: 'Cinzel',
                        fontSize: 16,
                        color: AppColor.MAROON),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '𑐖𑐶 𑐐𑐸 𑐣𑐵 ',
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontSize: 18,
                        color: AppColor.MAROON),
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

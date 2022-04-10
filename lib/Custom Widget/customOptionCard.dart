import 'dart:ffi';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Presentation/colors.dart';
import 'package:nepalbhasafyp/Screens/Favorite%20Screen/favouritePage.dart';

import '../Models/Phrase.dart';

class OptionCard extends StatefulWidget {
  final String? option;

  const OptionCard({
    this.option,
  });
  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
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
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.CREAM,
              gradient: LinearGradient(colors: [
                AppColor.CREAM.withOpacity(0.9),
                AppColor.CREAM.withOpacity(0.9)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Column(
              children: [
                Container(
                  // margin: ,
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.option!,
                    style: TextStyle(
                        fontFamily: 'Cinzel',
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

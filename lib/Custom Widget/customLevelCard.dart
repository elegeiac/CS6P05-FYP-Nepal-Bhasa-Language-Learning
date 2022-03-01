import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Presentation/colors.dart';

class LevelCard extends StatelessWidget {
  final String image;
  final String levelText;
  const LevelCard({
    Key? key,
    required this.image,
    required this.levelText,
  }) : super(key: key);

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
            width: 350,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColor.CREAM.withOpacity(0.7)),
              gradient: LinearGradient(colors: [
                Colors.white.withOpacity(0.8),
                Colors.white.withOpacity(0.4)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.all(20),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(this.image),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  width: 230,
                  // margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      this.levelText,
                      style: TextStyle(
                          fontFamily: 'Cinzel',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColor.MAROON),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override

  // TODO: implement createState
  Size get preferredSize => Size.fromHeight(50.0);
}

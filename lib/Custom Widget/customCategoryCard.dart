import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Presentation/colors.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String categoryText;
  const CategoryCard({
    Key? key,
    required this.image,
    required this.categoryText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(22, 0, 0, 10),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            width: 160,
            height: 145,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColor.CREAM.withOpacity(0.7)),
              gradient: LinearGradient(colors: [
                Colors.white.withOpacity(0.8),
                Colors.white.withOpacity(0.4)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.all(20),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(this.image),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      this.categoryText,
                      style: TextStyle(
                          fontFamily: 'Cinzel',
                          fontSize: 20,
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

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../Custom Widget/customLevelCard.dart';
import '../../Presentation/colors.dart';
import 'Level Screen/advancedPage.dart';
import 'Level Screen/beginnerPage.dart';
import 'Level Screen/intermmediatePage.dart';

class levelPage extends StatefulWidget {
  const levelPage({Key? key}) : super(key: key);

  @override
  _levelPageState createState() => _levelPageState();
}

class _levelPageState extends State<levelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: [
              Container(
                  child: Text(
                'Select Your Level',
                style: TextStyle(
                  fontFamily: 'Cinzel',
                  fontSize: 20,
                  color: AppColor.CREAM,
                ),
              )),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const beginnerPage()),
                  );
                },
                child: LevelCard(
                    image: "static/levelpage/beginner.png",
                    levelText: 'Beginner'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const interPage()),
                  );
                },
                child: LevelCard(
                    image: "static/levelpage/intermmediate.png",
                    levelText: 'Intermmediate'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const advancedPage()),
                  );
                },
                child: LevelCard(
                    image: "static/levelpage/advanced.png",
                    levelText: 'Advanced'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

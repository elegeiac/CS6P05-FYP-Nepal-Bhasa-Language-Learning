import 'dart:ui';
import 'package:flutter/material.dart';
import '../../Custom Widget/customLevelCard.dart';
import '../../Presentation/colors.dart';
import 'Quiz Levels/advancedQuiz.dart';
import 'Quiz Levels/beginnerQuiz.dart';
import 'Quiz Levels/intermmeiateQuiz.dart';

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
                        builder: (context) => const beginnerQuiz()),
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
                    MaterialPageRoute(
                        builder: (context) => const intermmediateQuiz()),
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
                        builder: (context) => const advancedQuiz()),
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

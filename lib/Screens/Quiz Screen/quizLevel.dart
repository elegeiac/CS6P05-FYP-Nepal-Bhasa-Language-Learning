import 'dart:ui';
import 'package:flutter/material.dart';
import '../../Custom Widget/customAppbar.dart';
import '../../Custom Widget/customLevelCard.dart';
import '../../Presentation/colors.dart';
import 'Questions/intermmediateQues.dart';
import 'Quiz Levels/advanceQuiz.dart';
import 'Quiz Levels/begQuiz.dart';
import 'Quiz Levels/interQuiz.dart';

class quizLevelPage extends StatefulWidget {
  const quizLevelPage({Key? key}) : super(key: key);

  @override
  _quizLevelPageState createState() => _quizLevelPageState();
}

class _quizLevelPageState extends State<quizLevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "quiz",
        automaticallyImplyLeading: true,
      ),
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
                    MaterialPageRoute(builder: (context) => beginnerQuizPage()),
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
                        builder: (context) => intermmediateQuizPage()),
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
                    MaterialPageRoute(builder: (context) => advancedQuizPage()),
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

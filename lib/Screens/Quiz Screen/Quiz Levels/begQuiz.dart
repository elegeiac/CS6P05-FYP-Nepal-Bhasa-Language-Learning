import 'dart:typed_data';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';
import '../Options.dart';
import '../Questions/beginnerQues.dart';
import '../quizLevel.dart';

class beginnerQuizPage extends StatefulWidget {
  const beginnerQuizPage({Key? key}) : super(key: key);

  @override
  _beginnerQuizPageState createState() => _beginnerQuizPageState();
}

class _beginnerQuizPageState extends State<beginnerQuizPage> {
  late AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    // create this only once
    audioCache = AudioCache(
        prefix: "assets/audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  List<dynamic> questionPage = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool optionWasSelected = false;
  bool endOfQuiz = false;
  bool correctOptionSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      optionWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctOptionSelected = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.green[700],
          content: Text(
            'Correct Answer',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[200], fontFamily: 'Nexa'),
          ),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.red[700],
          content: Text(
            'Wrong Answer',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[200], fontFamily: 'Nexa'),
          ),
        ));
      }
      // adding to the score tracker on top

      //when the quiz ends
      if (_questionIndex + 1 == beginnerQues.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      optionWasSelected = false;
      correctOptionSelected = false;
    });
    // what happens at the end of the quiz
    if (_questionIndex >= beginnerQues.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      endOfQuiz = false;
      optionWasSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> questionPage = [];
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "beginner",
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(20, 30, 0, 10),
              child: Text(
                'Your Score: ${_totalScore * 10}/${beginnerQues.length * 10}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColor.CREAM,
                  fontFamily: 'Cinzel',
                ),
              ),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.CREAM,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                          child: Text('Question ${_questionIndex + 1}',
                              style: TextStyle(
                                  color: AppColor.MAROON,
                                  fontFamily: 'Cinzel',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        beginnerQues[_questionIndex]['category'] == 'image'
                            ? Column(
                                children: [
                                  Text(
                                    beginnerQues[_questionIndex]['question']
                                        as String,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: AppColor.MAROON,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      width: 320,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            beginnerQues[_questionIndex]
                                                ['image'] as String,
                                          ),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : beginnerQues[_questionIndex]['category'] ==
                                    'audio'
                                ? Column(
                                    children: [
                                      Text(
                                        beginnerQues[_questionIndex]['question']
                                            as String,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: AppColor.MAROON,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.play_circle_filled_outlined,
                                            color: AppColor.MAROON,
                                            size: 50.0,
                                          ),
                                          onPressed: () => audioCache.play(
                                              beginnerQues[_questionIndex]
                                                  ['audio'] as String)),
                                    ],
                                  )
                                : Text(
                                    beginnerQues[_questionIndex]['question']
                                        as String,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: AppColor.MAROON,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ...(beginnerQues[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map(
              (answer) => Option(
                optionText: answer['optionText'] as String,
                optionColor: optionWasSelected
                    ? answer['score'] as bool
                        ? Colors.green[700]
                        : Colors.red[700]
                    : AppColor.CREAM,
                optionTap: () {
                  // if answer was already selected then nothing happens onTap
                  if (optionWasSelected) {
                    return;
                  }
                  //answer is being selected
                  _questionAnswered(answer['score'] as bool);
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColor.CREAM,
                minimumSize: Size(200, 50),
              ),
              onPressed: () {
                if (!optionWasSelected) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: AppColor.CREAM,
                    content: Text(
                      'Please answer the question before proceeding to the next one.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: AppColor.MAROON, fontFamily: 'Nexa'),
                    ),
                  ));
                  return;
                }
                if (endOfQuiz) {
                  showDialog(
                      barrierColor: AppColor.GREY.withOpacity(0.9),
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: AppColor.CREAM,
                            title: Text(
                              'Result',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.MAROON,
                                  fontFamily: 'Cinzel',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                                _totalScore > 6
                                    ? 'Congratulations! \n Your final score is: ${_totalScore * 10}/${beginnerQues.length * 10}'
                                    : 'Your final score is: ${_totalScore * 10}/${beginnerQues.length * 10} \n Better luck next time!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 35.0,
                                  color: AppColor.MAROON,
                                  fontFamily: 'Caveat',
                                )),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: AppColor.MAROON,
                                ),
                                child: Text('Restart Quiz',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: AppColor.CREAM,
                                        fontFamily: 'Cinzel')),
                                onPressed: () {
                                  _resetQuiz();
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: AppColor.MAROON,
                                ),
                                child: Text('End Quiz',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: AppColor.CREAM,
                                        fontFamily: 'Cinzel')),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const quizLevelPage()),
                                  );
                                },
                              ),
                            ],
                          ));
                  return;
                }
                _nextQuestion();
              },
              child: Text(
                endOfQuiz ? 'View Result' : 'Next Question',
                style: TextStyle(
                    color: AppColor.MAROON,
                    fontFamily: 'Cinzel',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

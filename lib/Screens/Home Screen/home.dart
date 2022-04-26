import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Screens/History%20Screen/historyPage.dart';
import '../../Custom Widget/customAppbar.dart';
import '../../Presentation/colors.dart';
import '../Dictionary Screen/dictionary.dart';
import '../Dictionary Screen/levels.dart';
import '../Feedback Screen/feedbackPage.dart';
import '../Letterbook Screen/letterBookPage.dart';
import '../Quiz Screen/quizLevel.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: CustomAppBar(
          title: "NEPAL BHASA LEARNING",
          automaticallyImplyLeading: false,
        ),
        backgroundColor: AppColor.MAROON,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const dictionaryPage()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
                        height: 115,
                        width: 155,
                        // color: Colors.blueGrey,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('static/homepage/dictionary.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const historyPage()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        height: 115,
                        width: 155,
                        // color: Colors.blueGrey,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('static/homepage/history.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const dictionaryPage()),
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
                          child: Text(
                            'Dictionary',
                            style: TextStyle(
                              fontFamily: 'Nexa',
                              fontSize: 20,
                              color: AppColor.CREAM,
                            ),
                          )),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const historyPage()),
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(100, 10, 0, 0),
                          child: Text(
                            'History',
                            style: TextStyle(
                              fontFamily: 'Nexa',
                              fontSize: 20,
                              color: AppColor.CREAM,
                            ),
                          )),
                    )
                  ],
                ),

                //SECOND ROW
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const letterPage()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
                        height: 115,
                        width: 155,
                        // color: Colors.blueGrey,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('static/homepage/letterbook.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const quizLevelPage()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        height: 115,
                        width: 155,
                        // color: Colors.blueGrey,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('static/homepage/quiz.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const letterPage()),
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(35, 10, 0, 0),
                          child: Text(
                            'Lipi Letterbook',
                            style: TextStyle(
                              fontFamily: 'Nexa',
                              fontSize: 20,
                              color: AppColor.CREAM,
                            ),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(90, 10, 0, 0),
                        child: Text(
                          'Quiz',
                          style: TextStyle(
                            fontFamily: 'Nexa',
                            fontSize: 20,
                            color: AppColor.CREAM,
                          ),
                        )),
                  ],
                ),

                //THIRD ROW
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                      height: 115,
                      width: 155,
                      // color: Colors.blueGrey,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('static/homepage/feedback.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const feedbackPage()),
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(55, 10, 0, 0),
                          child: Text(
                            'Feedback',
                            style: TextStyle(
                              fontFamily: 'Nexa',
                              fontSize: 20,
                              color: AppColor.CREAM,
                            ),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

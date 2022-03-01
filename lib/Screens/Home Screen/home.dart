import 'package:flutter/material.dart';
import '../../Custom Widget/customAppbar.dart';
import '../../Presentation/colors.dart';
import '../Dictionary Screen/dictionary.dart';

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
                    Container(
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
                  ],
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(50, 10, 0, 0),
                        child: Text(
                          'Dictionary',
                          style: TextStyle(
                            fontFamily: 'Cinzel',
                            fontSize: 20,
                            color: AppColor.CREAM,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(80, 10, 0, 0),
                        child: Text(
                          'History',
                          style: TextStyle(
                            fontFamily: 'Cinzel',
                            fontSize: 20,
                            color: AppColor.CREAM,
                          ),
                        ))
                  ],
                ),

                //SECOND ROW
                Row(
                  children: [
                    Container(
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
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      height: 115,
                      width: 155,
                      // color: Colors.blueGrey,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('static/homepage/test.gif'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(25, 10, 0, 0),
                        child: Text(
                          'Lipi Letterbook',
                          style: TextStyle(
                            fontFamily: 'Cinzel',
                            fontSize: 20,
                            color: AppColor.CREAM,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(80, 10, 0, 0),
                        child: Text(
                          'Test',
                          style: TextStyle(
                            fontFamily: 'Cinzel',
                            fontSize: 20,
                            color: AppColor.CREAM,
                          ),
                        ))
                  ],
                ),

                //THIRD ROW
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
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
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
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
                    Container(
                        margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
                        child: Text(
                          'Lipi Quiz',
                          style: TextStyle(
                            fontFamily: 'Cinzel',
                            fontSize: 20,
                            color: AppColor.CREAM,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(90, 10, 0, 0),
                        child: Text(
                          'Feedback',
                          style: TextStyle(
                            fontFamily: 'Cinzel',
                            fontSize: 20,
                            color: AppColor.CREAM,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

// import 'dart:ffi';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Presentation/colors.dart';
import 'package:nepalbhasafyp/Screens/Favorite%20Screen/favouritePage.dart';

import '../Models/Phrase.dart';
import '../Network/token_shared_preferences.dart';

class WordCard extends StatefulWidget {
  final String? engMeaning;
  final String? devTrans;
  final String? engTrans;
  final String? lipiTrans;
  final String? lipiNarration;
  final Function()? fav;

  // final AudioElement? narration;
  const WordCard({
    this.engMeaning,
    this.devTrans,
    this.engTrans,
    this.lipiTrans,
    this.lipiNarration,
    this.fav,
  });
  @override
  _WordCardState createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  AudioPlayer audioPlayer = AudioPlayer();

  initAudio() {
    audioPlayer.play(widget.lipiNarration!);
  }

  bool toggle = false;
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
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.CREAM,
              // gradient: LinearGradient(colors: [
              //   AppColor.CREAM.withOpacity(0.9),
              //   AppColor.CREAM.withOpacity(0.9)
              // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      // margin: ,
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Meaning:',
                        style: TextStyle(
                            fontFamily: 'Cinzel',
                            fontSize: 18,
                            color: AppColor.MAROON),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(190, 0, 0, 0),
                        // child: BookmarkButton(phrase: Phrase);
                        child: IconButton(
                          icon: toggle
                              ? Icon(Icons.bookmark,
                                  size: 28.0, color: AppColor.MAROON)
                              : Icon(Icons.bookmark_add_outlined,
                                  size: 28.0, color: AppColor.MAROON),
                          onPressed: widget.fav,
                        ))
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.engMeaning!,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontSize: 20,
                        color: AppColor.MAROON),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Translation:',
                        style: TextStyle(
                            fontFamily: 'Cinzel',
                            fontSize: 18,
                            color: AppColor.MAROON),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(150, 0, 0, 0),
                      child: IconButton(
                          icon: Icon(
                            Icons.play_circle_filled_outlined,
                            color: AppColor.MAROON,
                            size: 30.0,
                          ),
                          onPressed: () {
                            initAudio();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.blueGrey[200],
                              content: Text(
                                "Playing Narration",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.MAROON,
                                    fontFamily: 'Nexa'),
                              ),
                            ));
                          }),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.devTrans!,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontSize: 20,
                        color: AppColor.MAROON),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.engTrans!,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontSize: 20,
                        color: AppColor.MAROON),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Ranjana Lipi:',
                    style: TextStyle(
                        fontFamily: 'Cinzel',
                        fontSize: 18,
                        color: AppColor.MAROON),
                  ),
                ),
                Container(
                  child: Center(
                    child: Image.network(widget.lipiTrans!,
                        width: 300, height: 80, fit: BoxFit.fitWidth),
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

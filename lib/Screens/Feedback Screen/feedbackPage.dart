import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Screens/Login%20Screen/loginForm.dart';
import 'package:nepalbhasafyp/Screens/Register%20Screen/register.dart';
import 'package:nepalbhasafyp/presentation/colors.dart';

import '../../Custom Widget/customAppbar.dart';
import 'feedbackForm.dart';

class feedbackPage extends StatefulWidget {
  const feedbackPage({Key? key}) : super(key: key);

  @override
  _feedbackPageState createState() => _feedbackPageState();
}

class _feedbackPageState extends State<feedbackPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CustomAppBar(
          title: "feedback",
          automaticallyImplyLeading: true,
        ),
        backgroundColor: AppColor.MAROON,
        body: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                    child: feedbackForm()),
              ],
            ),
          ),
        ));
  }
}

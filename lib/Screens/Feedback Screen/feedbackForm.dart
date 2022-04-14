import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/presentation/colors.dart';

import '../../Custom Widget/customFeedbackTextFormField.dart';
import '../../Custom Widget/customPasswordTextFormField.dart';
import '../../Custom Widget/customTextFormField.dart';
import '../../Network/service.dart';
import '../Home Screen/home.dart';

class feedbackForm extends StatefulWidget {
  const feedbackForm({Key? key}) : super(key: key);

  @override
  _feedbackFormState createState() => _feedbackFormState();
}

class _feedbackFormState extends State<feedbackForm> {
  final feedbackFormKey = GlobalKey<FormState>();
  final subjectController = TextEditingController();
  final feedbackController = TextEditingController();
  var feedbackResponse;

  bool clickSend = false;
  String? subjectInput;
  String? descInput;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: AppColor.MAROON,
    primary: AppColor.CREAM,
    minimumSize: Size(100, 40),
    padding: EdgeInsets.symmetric(horizontal: 20),
    shadowColor: AppColor.BLACK,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 520,
      width: 370,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColor.MAROON.withOpacity(0.7)),
          color: Colors.white.withOpacity(0.1)),
      child: Form(
        key: feedbackFormKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Center(
                child: Text(
                  "Feedback",
                  style: TextStyle(
                    fontFamily: 'Cinzel',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: AppColor.CREAM,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 40, 0, 5),
                  child: Text(
                    "Subject",
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 20,
                      color: AppColor.CREAM,
                    ),
                  ),
                ),
                CustomTextFormField(
                  hint: "Please enter your subject",
                  controller: subjectController,
                  save: (data) {
                    subjectInput = data;
                  },
                  hideText: false,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 0, 5),
                  child: Text(
                    "Feedback",
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 20,
                      color: AppColor.CREAM,
                    ),
                  ),
                ),
                CustomFeedbackTextFormField(
                  hint: "Please enter your feedback",
                  controller: feedbackController,
                  save: (data) {
                    descInput = data;
                  },
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        SendFeedbackFunction(context);
                      },
                      child: Text(
                        "Send Feedback",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Cinzel',
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  SendFeedbackFunction(BuildContext context) async {
    if (feedbackFormKey.currentState!.validate()) {
      feedbackFormKey.currentState!.save();
      clickSend = true;
      setState(() {});

      //feedbackResponse = await FeedbackService.login(subjectInput, descInput);
      print('FIRST PRINT $feedbackResponse');

      // print('TOKEN = ${loginResponse['token']}');

      await Future.delayed(const Duration(seconds: 0));
      print("HERE IS RESPONSE $feedbackResponse");
      if (feedbackResponse == null) {
        print("HERE AGAIN");
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Your login credentitals are invalid. Please check and try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // dismisses only the dialog and returns nothing
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const homePage()),
        );
      }
    } else {
      loginError(context);
      clickSend = false;
    }
  }

  loginError(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("${feedbackResponse["status"].toUpperCase()}"),
      content: Text("${feedbackResponse["message"]}"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

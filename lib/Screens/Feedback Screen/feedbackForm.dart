import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/presentation/colors.dart';
import 'package:url_launcher/url_launcher.dart';
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
      height: 570,
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
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: ElevatedButton(
                      style: raisedButtonStyle,
                      child: Text(
                        "Send Feedback",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Cinzel',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        if (feedbackFormKey.currentState!.validate()) {
                          feedbackFormKey.currentState!.save();
                          FeedbackService.sendFeeback(
                              subject: subjectInput, description: descInput);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.blueGrey[200],
                            content: Text(
                              "Thank you for your feedback!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.MAROON,
                                  fontFamily: 'Nexa'),
                            ),
                          ));
                        }
                        subjectController.clear();
                        feedbackController.clear();
                      }),

                  // SendFeedbackFunction(context);
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextButton(
                      child: Text(
                        "Send as Email",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nexa',
                          color: AppColor.CREAM,
                        ),
                      ),
                      onPressed: () async {
                        if (feedbackFormKey.currentState!.validate()) {
                          feedbackFormKey.currentState!.save();

                          const toEmail = 'ushaan2000@gmail.com';
                          final subject = "$subjectInput";
                          final message = '$descInput';
                          final url =
                              'mailto: $toEmail?subject=$subject&body=$message';
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceSafariVC: false,
                            );
                          }
                        }
                      }),

                  // SendFeedbackFunction(context);
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/presentation/colors.dart';

import '../../Custom Widget/customPasswordTextFormField.dart';
import '../../Custom Widget/customTextFormField.dart';
import '../Home Screen/home.dart';

class loginForm extends StatefulWidget {
  const loginForm({Key? key}) : super(key: key);

  @override
  _loginFormState createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePassword = true;

  String? passwordInput;
  String? emailInput;

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
      child: Form(
        key: loginFormKey,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(40, 40, 0, 0),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 20,
                      color: AppColor.CREAM,
                    ),
                  ),
                ),
                CustomTextFormField(
                  hint: "Please enter your email address",
                  controller: emailController,
                  save: (data) {
                    emailInput = data;
                  },
                  hideText: false,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(40, 20, 0, 0),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 20,
                      color: AppColor.CREAM,
                    ),
                  ),
                ),
                customPassTextFormField(
                  hint: "Please enter your password",
                  controller: passwordController,
                  save: (data) {
                    passwordInput = data;
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
                      onPressed: () {
                        if (loginFormKey.currentState!.validate()) {
                          loginFormKey.currentState!.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const homePage()),
                          );
                        }
                      },
                      child: Text(
                        "SIGN IN",
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
}

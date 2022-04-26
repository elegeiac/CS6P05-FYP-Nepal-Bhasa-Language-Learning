import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/presentation/colors.dart';

import '../../Custom Widget/customPasswordTextFormField.dart';
import '../../Custom Widget/customTextFormField.dart';
import '../../Network/service.dart';
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
  var loginResponse;
  bool hidePassword = true;
  bool clickLogin = false;
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
                        SignInFunction(context);
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

  SignInFunction(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      clickLogin = true;
      setState(() {});

      loginResponse = await LoginService.login(emailInput, passwordInput);
      print('FIRST PRINT $loginResponse');

      // print('TOKEN = ${loginResponse['token']}');

      await Future.delayed(const Duration(seconds: 0));
      print("HERE IS RESPONSE $loginResponse");
      if (loginResponse == null) {
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
      clickLogin = false;
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
      title: Text("${loginResponse["status"].toUpperCase()}"),
      content: Text("${loginResponse["message"]}"),
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

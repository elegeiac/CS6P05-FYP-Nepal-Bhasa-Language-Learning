import 'package:flutter/material.dart';

import '../../Custom Widget/customPasswordTextFormField.dart';
import '../../Custom Widget/customTextFormField.dart';
import '../../Network/service.dart';
import '../../Presentation/colors.dart';
import '../Login Screen/login.dart';

class registerForm extends StatefulWidget {
  const registerForm({Key? key}) : super(key: key);

  @override
  _registerFormState createState() => _registerFormState();
}

class _registerFormState extends State<registerForm> {
  final registerFormKey = GlobalKey<FormState>();
  final fnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumController = TextEditingController();
  final passwordController = TextEditingController();
  var RegisterResponse;
  bool clickRegister = false;

  // final conPasswordController = TextEditingController();

  String? fnameInput;
  String? emailInput;
  String? phoneNumInput;
  String? passwordInput;
  // String? conPasswordInput;

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
        key: registerFormKey,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
                  child: Text(
                    "Full Name",
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 20,
                      color: AppColor.CREAM,
                    ),
                  ),
                ),
                CustomTextFormField(
                  hint: "Please enter your full name",
                  controller: fnameController,
                  save: (data) {
                    fnameInput = data;
                  },
                  hideText: false,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
                  child: Text(
                    "Phone Number",
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 20,
                      color: AppColor.CREAM,
                    ),
                  ),
                ),
                CustomTextFormField(
                  hint: "Please enter your phone number",
                  controller: phoneNumController,
                  save: (data) {
                    phoneNumInput = data;
                  },
                  hideText: false,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
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
                  margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
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
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        SignUpFunction(context);
                      },
                      child: Text(
                        "REGISTER",
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

  SignUpFunction(BuildContext context) async {
    print("2here");
    if (registerFormKey.currentState!.validate()) {
      print("1here");
      registerFormKey.currentState!.save();

      setState(() {
        clickRegister = true;
      });
      print(clickRegister);
      print("1here");
      RegisterResponse = await RegisterService.register(
          fnameInput, phoneNumInput, emailInput, passwordInput);
      print('FIRST PRINT $RegisterResponse');
      if (RegisterResponse == null) {
        print("HERE AGAIN");
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Your register credentitals are invalid. Please check and try again.'),
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => loginPage()));
      }

      // print('ACCESS TOKEN = ${registerResponse['access_token']}');
      //   print('REFRESH TOKEN = ${registerResponse["refresh_token"]}');

    } else {
      loginError(context);
      clickRegister = false;
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
      title: Text("${RegisterResponse["status"].toUpperCase()}"),
      content: Text("${RegisterResponse["message"]}"),
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

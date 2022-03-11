import 'package:flutter/material.dart';

import '../../Presentation/colors.dart';
import '../Login Screen/login.dart';
import 'registerForm.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColor.BLACK,
        body: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.blueGrey,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('static/Kumari.jpg'),
                          fit: BoxFit.fitWidth,
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 160, 0, 0),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: size.height * 0.795,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColor.MAROON,
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 3,
                      // ),
                      borderRadius: BorderRadius.circular(50)),
                  //child: loginForm()),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 170, 0, 0),
                  child: Center(
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                        fontFamily: 'Samarkan',
                        fontSize: 40,
                        color: AppColor.CREAM,
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 220, 0, 0),
                    child: registerForm()),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 745, 0, 0),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const loginPage()),
                        );
                      },
                      child: Text(
                        "Already have an account? Sign In Here",
                        style: TextStyle(
                          fontFamily: 'Cinzel',
                          fontSize: 14,
                          color: AppColor.CREAM,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

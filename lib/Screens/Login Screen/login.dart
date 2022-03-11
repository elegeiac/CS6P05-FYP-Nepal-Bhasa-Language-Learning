import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Screens/Login%20Screen/loginForm.dart';
import 'package:nepalbhasafyp/Screens/Register%20Screen/register.dart';
import 'package:nepalbhasafyp/presentation/colors.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
                          image: AssetImage('static/Lakhey.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 215, 0, 0),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: size.height * 0.73,
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
                  margin: EdgeInsets.fromLTRB(0, 255, 0, 0),
                  child: Center(
                    child: Text(
                      "NEPAL BHASA LEARNING",
                      style: TextStyle(
                        fontFamily: 'Samarkan',
                        fontSize: 40,
                        color: AppColor.CREAM,
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 300, 0, 0),
                    child: loginForm()),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 700, 0, 0),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const registerPage()),
                        );
                      },
                      child: Text(
                        "Don't have an account? Register Here",
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

import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/testScreen.dart';
import 'Screens/Login Screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nepal Bhasa Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const loginPage(),
    );
  }
}

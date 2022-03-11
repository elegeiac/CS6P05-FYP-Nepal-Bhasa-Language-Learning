import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/testField.dart';

class testScreen extends StatefulWidget {
  const testScreen({Key? key}) : super(key: key);

  @override
  State<testScreen> createState() => _testScreenState();
}

class _testScreenState extends State<testScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(child: Center(child: testField())),
    );
  }
}

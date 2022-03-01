import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class timePage extends StatefulWidget {
  const timePage({Key? key}) : super(key: key);

  @override
  _timePageState createState() => _timePageState();
}

class _timePageState extends State<timePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Time",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

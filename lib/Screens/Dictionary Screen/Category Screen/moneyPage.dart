import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class moneyPage extends StatefulWidget {
  const moneyPage({Key? key}) : super(key: key);

  @override
  _moneyPageState createState() => _moneyPageState();
}

class _moneyPageState extends State<moneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Money",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class greetingPage extends StatefulWidget {
  const greetingPage({Key? key}) : super(key: key);

  @override
  _greetingPageState createState() => _greetingPageState();
}

class _greetingPageState extends State<greetingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Greetings",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class beginnerPage extends StatefulWidget {
  const beginnerPage({Key? key}) : super(key: key);

  @override
  _beginnerPageState createState() => _beginnerPageState();
}

class _beginnerPageState extends State<beginnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Beginner",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

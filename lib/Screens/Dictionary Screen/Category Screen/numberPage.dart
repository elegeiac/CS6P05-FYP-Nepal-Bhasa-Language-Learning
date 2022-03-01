import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class numberPage extends StatefulWidget {
  const numberPage({Key? key}) : super(key: key);

  @override
  _numberPageState createState() => _numberPageState();
}

class _numberPageState extends State<numberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Numbers",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

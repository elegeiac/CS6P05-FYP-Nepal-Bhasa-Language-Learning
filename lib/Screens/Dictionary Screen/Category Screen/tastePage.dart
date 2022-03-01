import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class tastePage extends StatefulWidget {
  const tastePage({Key? key}) : super(key: key);

  @override
  _tastePageState createState() => _tastePageState();
}

class _tastePageState extends State<tastePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Taste",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

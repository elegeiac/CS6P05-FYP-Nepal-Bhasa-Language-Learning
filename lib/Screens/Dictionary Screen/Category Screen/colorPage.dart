import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class colorPage extends StatefulWidget {
  const colorPage({Key? key}) : super(key: key);

  @override
  _colorPageState createState() => _colorPageState();
}

class _colorPageState extends State<colorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Colors",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

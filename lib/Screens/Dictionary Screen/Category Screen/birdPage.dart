import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class birdPage extends StatefulWidget {
  const birdPage({Key? key}) : super(key: key);

  @override
  _birdPageState createState() => _birdPageState();
}

class _birdPageState extends State<birdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Birds",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

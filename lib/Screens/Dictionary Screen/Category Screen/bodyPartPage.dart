import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class bodyPartPage extends StatefulWidget {
  const bodyPartPage({Key? key}) : super(key: key);

  @override
  _bodyPartPageState createState() => _bodyPartPageState();
}

class _bodyPartPageState extends State<bodyPartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Body Parts",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

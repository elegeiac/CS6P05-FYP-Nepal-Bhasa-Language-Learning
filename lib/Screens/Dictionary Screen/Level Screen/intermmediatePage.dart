import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class interPage extends StatefulWidget {
  const interPage({Key? key}) : super(key: key);

  @override
  _interPageState createState() => _interPageState();
}

class _interPageState extends State<interPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Intermmediate",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class relationPage extends StatefulWidget {
  const relationPage({ Key? key }) : super(key: key);

  @override
  _relationPageState createState() => _relationPageState();
}

class _relationPageState extends State<relationPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Relations",
        automaticallyImplyLeading: true,
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class peoplePage extends StatefulWidget {
  const peoplePage({Key? key}) : super(key: key);

  @override
  _peoplePageState createState() => _peoplePageState();
}

class _peoplePageState extends State<peoplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "People",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

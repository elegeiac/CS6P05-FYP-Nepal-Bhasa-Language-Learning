import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class phrasePage extends StatefulWidget {
  const phrasePage({Key? key}) : super(key: key);

  @override
  _phrasePageState createState() => _phrasePageState();
}

class _phrasePageState extends State<phrasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Phrases",
        automaticallyImplyLeading: true,
      ),
    );
  }
}

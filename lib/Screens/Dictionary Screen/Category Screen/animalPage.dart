import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customWordCard.dart';
import 'package:nepalbhasafyp/Presentation/colors.dart';

import '../../../Custom Widget/customAppbar.dart';

class animalPage extends StatefulWidget {
  const animalPage({Key? key}) : super(key: key);

  @override
  _animalPageState createState() => _animalPageState();
}

class _animalPageState extends State<animalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Animals",
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [WordCard()],
        ),
      ),
    );
  }
}

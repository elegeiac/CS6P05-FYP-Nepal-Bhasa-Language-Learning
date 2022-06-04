import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customAppbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Presentation/colors.dart';

class aboutPage extends StatefulWidget {
  const aboutPage({Key? key}) : super(key: key);

  @override
  State<aboutPage> createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "about", automaticallyImplyLeading: true),
        backgroundColor: AppColor.MAROON,
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
  }
}

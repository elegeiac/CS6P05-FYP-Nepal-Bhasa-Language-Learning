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
            children: [
              Center(
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: Text(
                      'About the application',
                      style: TextStyle(
                        fontFamily: 'Cinzel',
                        fontSize: 20,
                        color: AppColor.CREAM,
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 40),
                child: Text(
                  "The 'Newa Chhen' Nepal Bhasa language learning mobile application helps you to learn basic Nepal Bhasa and Ranjana Lipi without any prior knowledge, as well as a means of helping to preserve the cultural language and script. This mobile application offers a variety of features to assist you to learn more about the Newar heritage, language, and culture.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: AppColor.CREAM, fontSize: 16, fontFamily: "Comic"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 115,
                width: 115,
                // color: Colors.blueGrey,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.CREAM, width: 3),
                  image: DecorationImage(
                    image: AssetImage('static/Client.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text(
                  "Ms. Sunita Dangol",
                  style: TextStyle(
                      color: AppColor.CREAM, fontSize: 16, fontFamily: "Comic"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Deputy Mayor, Kathmandu Metropolitan City",
                  style: TextStyle(
                      color: AppColor.CREAM, fontSize: 16, fontFamily: "Comic"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Intangible Cultural Heritage Advocate",
                  style: TextStyle(
                      color: AppColor.CREAM, fontSize: 16, fontFamily: "Comic"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 40, 15, 10),
                child: Text(
                  "Special Thanks:",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: AppColor.CREAM,
                      fontSize: 16,
                      fontFamily: "Cinzel"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Text(
                  "Mr. Jenish Sakya (Graphic Designer)",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: AppColor.CREAM, fontSize: 16, fontFamily: "Comic"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Text(
                  "Mr. Pranil Sakya (Photographer)",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: AppColor.CREAM, fontSize: 16, fontFamily: "Comic"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Text(
                  "Nepal Lipi - Ranjana Lipi (Type Newa) Application",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: AppColor.CREAM, fontSize: 16, fontFamily: "Comic"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 25, 15, 0),
                child: Text(
                  "© Developed by Ushaan Shrestha",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: AppColor.CREAM,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cinzel"),
                ),
              ),
            ],
          ),
        ));
  }
}

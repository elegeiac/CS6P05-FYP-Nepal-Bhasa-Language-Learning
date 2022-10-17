import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customAppbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Presentation/colors.dart';
import 'downloadingDialog.dart';

class historyPage extends StatefulWidget {
  const historyPage({Key? key}) : super(key: key);

  @override
  State<historyPage> createState() => _historyPageState();
}

class _historyPageState extends State<historyPage> {
  late Future<ListResult> futureFiles;

  int activeIndex = 0;
  final urlImages = [
    'static/history/img1.jpg',
    'static/history/img2.jpg',
    'static/history/img3.jpg',
    'static/history/img4.jpg',
    'static/history/img5.jpg',
  ];

  Widget buildImage(String urlImage, int index) => Container(
        decoration: BoxDecoration(
          color: AppColor.CREAM,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
        ),
        // height: 700,
        width: 1000,
        margin: EdgeInsets.symmetric(horizontal: 10),
        // color: CustomColors.GREY,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect:
            WormEffect(dotColor: Colors.brown, activeDotColor: AppColor.CREAM),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "history", automaticallyImplyLeading: true),
        backgroundColor: AppColor.MAROON,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: CarouselSlider.builder(
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.2,
                      // viewportFraction: 1,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: Duration(seconds: 2),
                      onPageChanged: (index, reason) => setState(
                            () => activeIndex = index,
                          )),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: buildIndicator()),
              Container(
                margin: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        "The Ranjana script, which is also known as Kutila or Lantsa, is one of the many alphabets derived from the Brahmi script. It developed during the 11th century AD and was used until the mid-20th century in India and Nepal by the Newa to write the Nepal Bhasa.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: AppColor.CREAM,
                            fontSize: 16,
                            fontFamily: "Nexa"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                          "Tibetans use this script, which they call Lantsa, for writing the Sanskrit titles of books which have been translated from Sanskrit to Tibetan, and for decoration in temples and mandalas. There are also a few texts printed with alternating lines in Sanskrit in the Lantsa script followed by a Tibetan translation. There were many original Sanskrit manuscripts written in Lantsa preserved in the old monasteries of Tibet but most of these were destroyed following the Chinese take-over",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: AppColor.CREAM,
                              fontSize: 16,
                              fontFamily: "Nexa")),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                          "In addition, Ranjana script is and was used mainly for decoration by Buddhists in China, Mongolia and Japan.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: AppColor.CREAM,
                              fontSize: 16,
                              fontFamily: "Nexa")),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.CREAM,
                          ),
                          child: Text(
                            "Download History Document",
                            style: TextStyle(
                              color: AppColor.MAROON,
                              fontSize: 14,
                              fontFamily: 'Nexa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (context) => const DownloadingDialog(),
                            );
                          }),

                      // SendFeedbackFunction(context);
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

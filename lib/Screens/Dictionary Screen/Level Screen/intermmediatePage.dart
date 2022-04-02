import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Custom Widget/customCategoryCard.dart';
import '../../../Presentation/colors.dart';
import '../listPage.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Text(
                  'Select the category',
                  style: TextStyle(
                    fontFamily: 'Cinzel',
                    fontSize: 20,
                    color: AppColor.CREAM,
                  ),
                )),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const listPage(
                              appbar: "body parts", category: "C3")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/body.png',
                    categoryText: 'Body Parts',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const listPage(appbar: "colors", category: "C4")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/color.png',
                    categoryText: 'Colors',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const listPage(appbar: "foods", category: "C5")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/food.png',
                    categoryText: 'Foods',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const listPage(appbar: "taste", category: "C12")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/taste.png',
                    categoryText: 'Taste',
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const listPage(appbar: "weather", category: "C14")),
                );
              },
              child: CategoryCard(
                image: 'static/categorypage/weather.png',
                categoryText: 'Weather',
              ),
            )
          ],
        ),
      ),
    );
  }
}

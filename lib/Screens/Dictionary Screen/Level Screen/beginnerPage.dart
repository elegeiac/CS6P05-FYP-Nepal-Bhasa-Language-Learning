import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Custom Widget/customCategoryCard.dart';
import '../../../Presentation/colors.dart';
import '../listPage.dart';

class beginnerPage extends StatefulWidget {
  const beginnerPage({Key? key}) : super(key: key);

  @override
  _beginnerPageState createState() => _beginnerPageState();
}

class _beginnerPageState extends State<beginnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
      appBar: CustomAppBar(
        title: "Beginner",
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
                              appbar: "greetings", category: "C6")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/greeting.png',
                    categoryText: 'Greetings',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const listPage(
                              appbar: "numbers", category: "C8")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/number.png',
                    categoryText: 'Numbers',
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
                          builder: (context) => const listPage(
                              appbar: "relations", category: "C11")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/relation.png',
                    categoryText: 'Relations',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const listPage(appbar: "time", category: "C13")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/time.png',
                    categoryText: 'Time',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

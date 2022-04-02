import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customCategoryCard.dart';

import '../../Presentation/colors.dart';
import 'listPage.dart';

class categoryPage extends StatefulWidget {
  const categoryPage({Key? key}) : super(key: key);

  @override
  _categoryPageState createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.MAROON,
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
                              appbar: "animals", category: "C1")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/animals.png',
                    categoryText: 'Animals',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const listPage(appbar: "birds", category: "C2")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/birds.png',
                    categoryText: 'Birds',
                  ),
                )
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
                )
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
                          builder: (context) => const listPage(
                              appbar: "greetings", category: "C6")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/greeting.png',
                    categoryText: 'Greetings',
                  ),
                )
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
                              const listPage(appbar: "money", category: "C7")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/money.png',
                    categoryText: 'Money',
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
                )
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
                              const listPage(appbar: "people", category: "C9")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/people.png',
                    categoryText: 'People',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const listPage(
                              appbar: "phrase", category: "C10")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/phrase.png',
                    categoryText: 'Phrases',
                  ),
                )
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
                              const listPage(appbar: "taste", category: "C12")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/taste.png',
                    categoryText: 'Taste',
                  ),
                )
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
                              const listPage(appbar: "time", category: "C13")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/time.png',
                    categoryText: 'Time',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const listPage(
                              appbar: "weather", category: "C14")),
                    );
                  },
                  child: CategoryCard(
                    image: 'static/categorypage/weather.png',
                    categoryText: 'Weather',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customCategoryCard.dart';

import '../../Presentation/colors.dart';
import 'Category Screen/animalPage.dart';
import 'Category Screen/birdPage.dart';
import 'Category Screen/bodyPartPage.dart';
import 'Category Screen/colorPage.dart';
import 'Category Screen/foodPage.dart';
import 'Category Screen/greetingPage.dart';
import 'Category Screen/moneyPage.dart';
import 'Category Screen/numberPage.dart';
import 'Category Screen/peoplePage.dart';
import 'Category Screen/phrasePage.dart';
import 'Category Screen/relationPage.dart';
import 'Category Screen/tastePage.dart';
import 'Category Screen/timePage.dart';
import 'Category Screen/weatherPage.dart';

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
                          builder: (context) => const animalPage()),
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
                      MaterialPageRoute(builder: (context) => const birdPage()),
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
                          builder: (context) => const bodyPartPage()),
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
                          builder: (context) => const colorPage()),
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
                      MaterialPageRoute(builder: (context) => const foodPage()),
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
                          builder: (context) => const greetingPage()),
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
                          builder: (context) => const moneyPage()),
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
                          builder: (context) => const numberPage()),
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
                          builder: (context) => const peoplePage()),
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
                          builder: (context) => const phrasePage()),
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
                          builder: (context) => const relationPage()),
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
                          builder: (context) => const tastePage()),
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
                      MaterialPageRoute(builder: (context) => const timePage()),
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
                          builder: (context) => const weatherPage()),
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

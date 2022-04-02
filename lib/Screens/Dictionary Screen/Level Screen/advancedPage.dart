import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Custom Widget/customCategoryCard.dart';
import '../../../Presentation/colors.dart';
import '../listPage.dart';

class advancedPage extends StatefulWidget {
  const advancedPage({Key? key}) : super(key: key);

  @override
  _advancedPageState createState() => _advancedPageState();
}

class _advancedPageState extends State<advancedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.MAROON,
        appBar: CustomAppBar(
          title: "Advanced",
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
              Row(children: [
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
              ]),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const listPage(
                                appbar: "money", category: "C7")),
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
                                appbar: "people", category: "C9")),
                      );
                    },
                    child: CategoryCard(
                      image: 'static/categorypage/people.png',
                      categoryText: 'People',
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
                            const listPage(appbar: "phrase", category: "C10")),
                  );
                },
                child: CategoryCard(
                  image: 'static/categorypage/phrase.png',
                  categoryText: 'Phrases',
                ),
              )
            ],
          ),
        ));
  }
}

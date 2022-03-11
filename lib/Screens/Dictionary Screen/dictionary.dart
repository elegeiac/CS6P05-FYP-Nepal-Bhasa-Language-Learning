import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Screens/Dictionary%20Screen/categories.dart';
import 'package:nepalbhasafyp/Screens/Dictionary%20Screen/levels.dart';

import '../../Custom Widget/customAppbar.dart';
import '../../Presentation/colors.dart';

class dictionaryPage extends StatefulWidget {
  const dictionaryPage({Key? key}) : super(key: key);

  @override
  _dictionaryPageState createState() => _dictionaryPageState();
}

class _dictionaryPageState extends State<dictionaryPage> {
  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.star,
        color: AppColor.MAROON,
      ),
      label: 'Levels',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.category,
        color: AppColor.MAROON,
      ),
      label: 'Categories',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [
          levelPage(),
          categoryPage(),
        ],
      ),
      appBar: CustomAppBar(
        title: "Dictionary",
        automaticallyImplyLeading: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white38,
        //backgroundColor: Colors.black,
        unselectedLabelStyle: TextStyle(fontFamily: 'Cinzel'),
        selectedLabelStyle: TextStyle(
            fontFamily: 'Cinzel', fontSize: 15, fontWeight: FontWeight.bold),
        selectedItemColor: AppColor.MAROON,
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        //type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

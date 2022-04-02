import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Screens/Dictionary%20Screen/categories.dart';
import 'package:nepalbhasafyp/Screens/Dictionary%20Screen/levels.dart';
import '../../Custom Widget/customAppbar.dart';
import '../../Presentation/colors.dart';
import 'Lipi Category/consonantPage.dart';
import 'Lipi Category/numberPage.dart';
import 'Lipi Category/vowelPage.dart';

class letterPage extends StatefulWidget {
  final String? category;
  final String? appbar;
  const letterPage({Key? key, this.category, this.appbar}) : super(key: key);

  @override
  _letterPageState createState() => _letterPageState();
}

class _letterPageState extends State<letterPage> {
  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.auto_stories_outlined,
        color: AppColor.MAROON,
      ),
      label: 'Vowels',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.menu_book_outlined,
        color: AppColor.MAROON,
      ),
      label: 'Consonants',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.format_list_numbered_outlined,
        color: AppColor.MAROON,
      ),
      label: 'Numbers',
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
        children: [vowelPage(), consonantPage(), numberPage()],
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

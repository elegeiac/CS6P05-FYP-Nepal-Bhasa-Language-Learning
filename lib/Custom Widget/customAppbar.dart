import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Network/service.dart';
import 'package:nepalbhasafyp/Screens/Login%20Screen/login.dart';

import '../Network/token_shared_preferences.dart';
import '../Presentation/colors.dart';
import '../Screens/About Screen/about.dart';
import '../Screens/Favorite Screen/favouritePage.dart';
import '../Screens/Feedback Screen/feedbackPage.dart';
import '../Screens/History Screen/historyPage.dart';
import '../Screens/Search Screen/searchPage.dart';
import '../Screens/test.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  const CustomAppBar(
      {Key? key, required this.title, required this.automaticallyImplyLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColor.MAROON),
      automaticallyImplyLeading: this.automaticallyImplyLeading,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Samarkan',
          fontSize: 22,
          color: AppColor.MAROON,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            // DictionaryService().getAllBookmarkPost();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const favouritePage(appbar: "favourites")),
            );
          },
          child: Icon(
            Icons.bookmark,
            color: AppColor.MAROON,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const searchPage(appbar: "search")),
              );
            },
            child: Icon(
              Icons.search,
              color: AppColor.MAROON,
            ),
          ),
        ),
        Container(
          child: PopupMenuButton(
              color: AppColor.CREAM,
              offset: Offset(0, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      "About App",
                      style:
                          TextStyle(fontFamily: 'Nexa', color: AppColor.MAROON),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Feedback",
                        style: TextStyle(
                            fontFamily: 'Nexa', color: AppColor.MAROON)),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Logout",
                        style: TextStyle(
                            fontFamily: 'Nexa', color: AppColor.MAROON)),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => aboutPage()),
                  );
                  print("About page is selected.");
                } else if (value == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => feedbackPage()),
                  );
                  print("feedback menu is selected.");
                } else if (value == 2) {
                  TokenSharedPrefernces.instance.removeToken("token");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginPage()),
                  );
                  print("Logout menu is selected.");
                }
              }),
          // margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
          // child: IconButton(icon: Icon(Icons.more_vert, color: AppColor.MAROON,), onPressed: () {}),
        ),
      ],
      backgroundColor: AppColor.CREAM,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}

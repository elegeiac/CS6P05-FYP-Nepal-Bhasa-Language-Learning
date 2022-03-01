import 'package:flutter/material.dart';

import '../Presentation/colors.dart';
import '../Screens/Favorite Screen/favouritePage.dart';
import '../Screens/Search Screen/searchPage.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const favoutitePage()),
            );
          },
          child: Icon(
            Icons.favorite,
            color: AppColor.MAROON,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const searchPage()),
              );
            },
            child: Icon(
              Icons.search,
              color: AppColor.MAROON,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: Icon(
            Icons.more_vert,
            color: AppColor.MAROON,
          ),
        ),
      ],
      backgroundColor: AppColor.CREAM,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}

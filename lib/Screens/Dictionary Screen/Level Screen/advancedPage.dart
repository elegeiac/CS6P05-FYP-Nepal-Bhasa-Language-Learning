import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class advancedPage extends StatefulWidget {
  const advancedPage({ Key? key }) : super(key: key);

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
    );
  }
}

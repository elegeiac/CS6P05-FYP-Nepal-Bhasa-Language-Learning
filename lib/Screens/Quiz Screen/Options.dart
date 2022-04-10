import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Presentation/colors.dart';

class Option extends StatelessWidget {
  final String? optionText;
  final Color? optionColor;
  final Function()? optionTap;

  Option({this.optionText, this.optionColor, this.optionTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: optionTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.CREAM,
          border: Border.all(color: optionColor!, width: 3.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          optionText!,
          style: TextStyle(
              fontSize: 18.0, fontFamily: 'Nexa', color: AppColor.MAROON),
        ),
      ),
    );
  }
}

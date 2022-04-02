import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customSearchBar.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customWordCard.dart';
import 'package:nepalbhasafyp/Models/Phrase.dart';
import 'package:nepalbhasafyp/Network/service.dart';
import 'package:characters/characters.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class searchPage extends StatefulWidget {
  final String? appbar;
  const searchPage({Key? key, this.appbar}) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

void searchBook(String query) {}

class _searchPageState extends State<searchPage> {
  get query => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.MAROON,
        appBar: CustomAppBar(
          title: widget.appbar!,
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(child: Column(children: [])));
  }
}

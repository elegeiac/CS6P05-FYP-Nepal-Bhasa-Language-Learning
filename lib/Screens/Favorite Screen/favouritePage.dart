import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customWordCard.dart';
import 'package:nepalbhasafyp/Models/Phrase.dart';
import 'package:nepalbhasafyp/Network/service.dart';
import 'package:characters/characters.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class favouritePage extends StatefulWidget {
  final String? appbar;
  final String? category;
  const favouritePage({Key? key, this.appbar, this.category}) : super(key: key);

  @override
  _favouritePageState createState() => _favouritePageState();
}

class _favouritePageState extends State<favouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.MAROON,
        appBar: CustomAppBar(
          title: widget.appbar!,
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          FutureBuilder(
              future: DictionaryService().getDictionary(),
              builder:
                  (context, AsyncSnapshot<List<DictionaryModel>> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: List.generate(snapshot.data!.length, (index) {
                      final data = snapshot.data![index];
                      return data.categoryId == widget.category
                          ? WordCard(
                              engMeaning: data.phraseEnglish,
                              devTrans: data.phraseDevnagari,
                              engTrans: data.phraseEnglish,
                              lipiTrans: data.phraseLipi)
                          : Container(height: 1);
                    }),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ])));
  }
}

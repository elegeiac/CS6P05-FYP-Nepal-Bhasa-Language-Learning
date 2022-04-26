import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customWordCard.dart';
import 'package:nepalbhasafyp/Models/Bookmark.dart';
import 'package:nepalbhasafyp/Models/Phrase.dart';
import 'package:nepalbhasafyp/Network/service.dart';
import 'package:characters/characters.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';

class favouritePage extends StatefulWidget {
  final String? appbar;
  // final String? category;
  const favouritePage({Key? key, this.appbar}) : super(key: key);

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
              future: DictionaryService().getAllBookmarkPost(),
              builder:
                  (context, AsyncSnapshot<List<GetBookmarkModel>> snapshot2) {
                // print('Data $snapshot2');
                if (snapshot2.hasData) {
                  return Column(
                    children: List.generate(
                      snapshot2.data!.length,
                      (index) {
                        final data2 = snapshot2.data![index];
                        return FutureBuilder(
                          future: DictionaryService().getDictionary(),
                          builder: (context,
                              AsyncSnapshot<List<DictionaryModel>> snapshot) {
                            // print('Data $snapshot');
                            if (snapshot.hasData) {
                              return Column(
                                children: List.generate(
                                  snapshot.data!.length,
                                  (index) {
                                    final data = snapshot.data![index];
                                    print("DATA $data");
                                    return data.phraseId == data2.phrase
                                        ? WordCard(
                                            engMeaning: data.phraseMeaning,
                                            devTrans: data.phraseDevnagari,
                                            engTrans: data.phraseEnglish,
                                            lipiTrans: data.phraseLipi,
                                            lipiNarration: data.phraseNarration,
                                            fav: () {
                                              DictionaryService().postBookmark(
                                                  data: data.phraseId);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        favouritePage(
                                                          appbar: "favourites",
                                                        )),
                                              );
                                            },
                                          )
                                        : const SizedBox(
                                            height: 1,
                                          );
                                  },
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        );
                      },
                    ),
                  );
                }
                return const CircularProgressIndicator();
              }),
        ])));
  }
}

import 'package:flutter/material.dart';

import '../../../Custom Widget/customAppbar.dart';
import '../../../Custom Widget/customLipiCard.dart';
import '../../../Models/Lipi.dart';
import '../../../Network/service.dart';
import '../../../Presentation/colors.dart';

class vowelPage extends StatefulWidget {
  const vowelPage({
    Key? key,
  }) : super(key: key);

  @override
  State<vowelPage> createState() => _vowelPageState();
}

class _vowelPageState extends State<vowelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.MAROON,
        appBar: CustomAppBar(
          title: 'vowels',
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          FutureBuilder(
              future: DictionaryService().getLipi(),
              builder: (context, AsyncSnapshot<List<LipiModel>> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: List.generate(snapshot.data!.length, (index) {
                      final data = snapshot.data![index];
                      return data.category == 'Vowel'
                          ? LipiCard(
                              lipiText: data.lipiText,
                              devLipi: data.lipiDevnagari,
                              engLipi: data.lipiEnglish)
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

import 'dart:convert';
import 'dart:ui';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customSearchBar.dart';
import 'package:nepalbhasafyp/Custom%20Widget/customWordCard.dart';
import 'package:nepalbhasafyp/Models/Phrase.dart';
import 'package:nepalbhasafyp/Network/service.dart';
import 'package:characters/characters.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../Custom Widget/customAppbar.dart';
import '../../../Presentation/colors.dart';
import '../../Models/searchPhraseModel.dart';
import '../../fypenv.sample.dart';

class searchPage extends StatefulWidget {
  final String? appbar;
  const searchPage({Key? key, this.appbar}) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

void searchBook(String query) {}

class _searchPageState extends State<searchPage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  double _confidence = 1.0;
  List<Posts> _list = [];
  List<Posts> _search = [];
  var loading = false;

  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response =
        await http.get(Uri.parse("${FypEnv.URL_PREFIX}/phraseList"));
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        for (Map i in data) {
          _list.add(Posts.formJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.phraseEnglish!.contains(text.toLowerCase()) ||
          f.phraseMeaning.toString().toLowerCase().contains(text.toLowerCase()))
        _search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "search",
        automaticallyImplyLeading: true,
      ),
      body: Container(
        color: AppColor.MAROON,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: AppColor.MAROON,
              child: Card(
                color: AppColor.CREAM,
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: AppColor.MAROON,
                  ),
                  title: TextField(
                    style: TextStyle(
                        color: AppColor.MAROON,
                        fontFamily: 'Nexa',
                        fontSize: 16),
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppColor.CREAM),
                  ),
                  trailing: Wrap(children: [
                    IconButton(
                      color: AppColor.MAROON,
                      onPressed: () {
                        _listen();
                      },
                      icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
                    ),
                    IconButton(
                      color: AppColor.MAROON,
                      onPressed: () {
                        controller.clear();
                        onSearch('');
                      },
                      icon: Icon(Icons.cancel),
                    ),
                  ]),
                ),
              ),
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: _search.length != 0 || controller.text.isNotEmpty
                        ? ListView.builder(
                            itemCount: _search.length,
                            itemBuilder: (context, i) {
                              final b = _search[i];
                              return WordCard(
                                engMeaning: b.phraseMeaning,
                                devTrans: b.phraseDevnagari,
                                engTrans: b.phraseEnglish,
                                lipiTrans: b.phraseLipi,
                                lipiNarration: b.phraseNarration,
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, i) {
                              final a = _list[i];
                              return WordCard(
                                engMeaning: a.phraseMeaning,
                                devTrans: a.phraseDevnagari,
                                engTrans: a.phraseEnglish,
                                lipiTrans: a.phraseLipi,
                                lipiNarration: a.phraseNarration,
                              );
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
          onStatus: (val) => print('onStatus: $val'),
          onError: (val) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red[700],
                content: Text(
                  "Could not recognize your voice",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColor.CREAM, fontFamily: 'Nexa'),
                ),
              )));
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            print(val);
            controller.text = val.recognizedWords;
            onSearch(val.recognizedWords);

            if (val.hasConfidenceRating && val.confidence > 10) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}

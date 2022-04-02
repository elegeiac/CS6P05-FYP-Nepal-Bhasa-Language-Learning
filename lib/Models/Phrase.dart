import 'dart:convert';

List<DictionaryModel> dictionaryModelFromJson(String str) =>
    List<DictionaryModel>.from(
        json.decode(str).map((x) => DictionaryModel.fromJson(x)));

String dictionaryModelToJson(List<DictionaryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DictionaryModel {
  DictionaryModel({
    this.phraseId,
    this.categoryId,
    this.phraseMeaning,
    this.phraseDevnagari,
    this.phraseEnglish,
    this.phraseLipi,
    this.phraseNarration,
  });

  String? phraseId;
  String? categoryId;
  String? phraseMeaning;
  String? phraseDevnagari;
  String? phraseEnglish;
  String? phraseLipi;
  String? phraseNarration;

  factory DictionaryModel.fromJson(Map<String, dynamic> json) =>
      DictionaryModel(
        phraseId: json["phraseID"],
        categoryId: json["categoryID"],
        phraseMeaning: json["phraseMeaning"],
        phraseDevnagari: json["phraseDevnagari"],
        phraseEnglish: json["phraseEnglish"],
        phraseLipi: json["phraseLipi"],
        phraseNarration: json["phraseNarration"],
      );

  Map<String, dynamic> toJson() => {
        "phraseID": phraseId,
        "categoryID": categoryId,
        "phraseMeaning": phraseMeaning,
        "phraseDevnagari": phraseDevnagari,
        "phraseEnglish": phraseEnglish,
        "phraseLipi": phraseLipi,
        "phraseNarration": phraseNarration,
      };

  getDictionary() {}
}

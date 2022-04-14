class Posts {
  String? phraseId;
  String? categoryId;
  String? phraseMeaning;
  String? phraseDevnagari;
  String? phraseEnglish;
  String? phraseLipi;
  String? phraseNarration;

  Posts({
    this.phraseId,
    this.categoryId,
    this.phraseMeaning,
    this.phraseDevnagari,
    this.phraseEnglish,
    this.phraseLipi,
    this.phraseNarration,
  });

  factory Posts.formJson(Map<dynamic, dynamic> json) {
    return new Posts(
      phraseId: json["phraseID"],
      categoryId: json["categoryID"],
      phraseMeaning: json["phraseMeaning"],
      phraseDevnagari: json["phraseDevnagari"],
      phraseEnglish: json["phraseEnglish"],
      phraseLipi: json["phraseLipi"],
      phraseNarration: json["phraseNarration"],
    );
  }
}

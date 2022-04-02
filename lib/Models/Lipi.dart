import 'dart:convert';

List<LipiModel> lipiModelFromJson(String str) =>
    List<LipiModel>.from(json.decode(str).map((x) => LipiModel.fromJson(x)));

String lipiModelToJson(List<LipiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LipiModel {
  LipiModel({
    this.lipiId,
    this.lipiText,
    this.category,
    this.lipiDevnagari,
    this.lipiEnglish,
  });

  String? lipiId;
  String? lipiText;
  String? category;
  String? lipiDevnagari;
  String? lipiEnglish;

  factory LipiModel.fromJson(Map<String, dynamic> json) => LipiModel(
        lipiId: json["lipiID"],
        lipiText: json["lipiText"],
        category: json["category"],
        lipiDevnagari: json["lipiDevnagari"],
        lipiEnglish: json["lipiEnglish"],
      );

  Map<String, dynamic> toJson() => {
        "lipiID": lipiId,
        "lipiText": lipiText,
        "category": category,
        "lipiDevnagari": lipiDevnagari,
        "lipiEnglish": lipiEnglish,
      };

  getLipi() {}
}

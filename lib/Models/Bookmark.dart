import 'dart:convert';

List<GetBookmarkModel> getBookmarkModelFromJson(String str) =>
    List<GetBookmarkModel>.from(
        json.decode(str).map((x) => GetBookmarkModel.fromJson(x)));

String getBookmarkToJson(List<GetBookmarkModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBookmarkModel {
  int? id;
  int? user;
  String? phrase;

  GetBookmarkModel({
    this.id,
    this.user,
    this.phrase,
  });

  factory GetBookmarkModel.fromJson(Map<String, dynamic> json) =>
  GetBookmarkModel (
    id : json['id'],
    user : json['user'],
    phrase : json['phrase'],
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user,
        'phrase': phrase,
      };
}

import 'dart:convert';

List<QuizModel> quizModelFromJson(String str) =>
    List<QuizModel>.from(json.decode(str).map((x) => QuizModel.fromJson(x)));

String quizModelToJson(List<QuizModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizModel {
  QuizModel({
    this.questionId,
    this.quizCategory,
    this.questionText,
    this.questionAudio,
    this.questionImage,
    this.opt1,
    this.opt2,
    this.opt3,
    this.correctOpt,
  });

  String? questionId;
  String? quizCategory;
  String? questionText;
  dynamic questionAudio;
  dynamic questionImage;
  String? opt1;
  String? opt2;
  String? opt3;
  String? correctOpt;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        questionId: json["questionID"],
        quizCategory: json["quizCategory"],
        questionText: json["questionText"],
        questionAudio: json["questionAudio"],
        questionImage: json["questionImage"],
        opt1: json["opt1"],
        opt2: json["opt2"],
        opt3: json["opt3"],
        correctOpt: json["correctOpt"],
      );

  Map<String, dynamic> toJson() => {
        "questionID": questionId,
        "quizCategory": quizCategory,
        "questionText": questionText,
        "questionAudio": questionAudio,
        "questionImage": questionImage,
        "opt1": opt1,
        "opt2": opt2,
        "opt3": opt3,
        "correctOpt": correctOpt,
      };
  getQuiz() {}
}

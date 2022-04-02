import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:nepalbhasafyp/Models/Lipi.dart';
import '../Models/Phrase.dart';
import '../Models/Quiz.dart';
import '../fypenv.sample.dart';

class DictionaryService {
  Future<List<DictionaryModel>> getDictionary() async {
    try {
      final req = await http.get(Uri.parse("${FypEnv.URL_PREFIX}/phraseList"));

      if (req.statusCode == 200) {
        final dictionaryModel =
            dictionaryModelFromJson(utf8.decode(req.bodyBytes));

        return dictionaryModel;
      } else {
        throw Exception('Failed to load dictionary');
      }
    } on SocketException catch (_) {
      return Future.error('No Network Found');
    }
  }

  Future<List<LipiModel>> getLipi() async {
    try {
      final reqLipi =
          await http.get(Uri.parse("${FypEnv.URL_PREFIX}/lipiList"));

      if (reqLipi.statusCode == 200) {
        final lipiModel = lipiModelFromJson(utf8.decode(reqLipi.bodyBytes));
        return lipiModel;
      } else {
        throw Exception('Failed to load dictionary');
      }
    } on SocketException catch (_) {
      return Future.error('No Network Found');
    }
  }

  Future<List<QuizModel>> getQuiz() async {
    try {
      final reqQuiz =
          await http.get(Uri.parse("${FypEnv.URL_PREFIX}/quizList"));

      if (reqQuiz.statusCode == 200) {
        final quizModel = quizModelFromJson(utf8.decode(reqQuiz.bodyBytes));
        return quizModel;
      } else {
        throw Exception('Failed to load dictionary');
      }
    } on SocketException catch (_) {
      return Future.error('No Network Found');
    }
  }
}

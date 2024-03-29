import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nepalbhasafyp/Models/Bookmark.dart';
import 'package:nepalbhasafyp/Models/Lipi.dart';
import 'package:nepalbhasafyp/Network/token_shared_preferences.dart';
import '../Models/Phrase.dart';
import '../Models/Quiz.dart';
import '../fypenv.sample.dart';

class DictionaryService {
  Future<List<DictionaryModel>> getDictionary() async {
    try {
      final req = await http.get(Uri.parse("${FypEnv.URL_PREFIX}/phraseList"));
      // final req = await Dio().get("${FypEnv.URL_PREFIX}/phraseList");
      if (req.statusCode == 200) {
        // final dictionaryModel = dictionaryModelFromJson(req.data);
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

  Future<String> postBookmark({required String? data}) async {
    print('USER ID: $data');
    String userToken =
        await TokenSharedPrefernces.instance.getTokenValue("token");
    print('USER TOKEN: $userToken');
    debugPrint('===============');
    debugPrint('${userToken}');
    debugPrint('===============');
    Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": "Token ${userToken}",
    };
    String endPointPatientValue = data.toString();
    final url =
        Uri.parse('${FypEnv.POST_BOOKMARK_URL_PREFIX}$endPointPatientValue/');
    debugPrint(url.toString());
    final response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      int code = response.statusCode;
      debugPrint('$code');
      debugPrint(response.body);
      return response.body;
    } else {
      throw Exception('Failed to load dictionary');
    }
  }

  Future<List<GetBookmarkModel>> getAllBookmarkPost() async {
    print("we are here");
    try {
      String userToken =
          await TokenSharedPrefernces.instance.getTokenValue("token");
      Map<String, String> headers = {
        "content-type": "application/json",
        "Authorization": "Token ${userToken}",
      };
      print("TOKEN ==== $userToken");

      final response = await http.get(
        Uri.parse(
          '${FypEnv.GET_BOOKMARK_URL_PREFIX}',
        ),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonData = getBookmarkModelFromJson(response.body);
        print(jsonData);
        return jsonData;
      } else {
        throw Exception('Failed to load dictionary');
      }
    } on SocketException catch (_) {
      return Future.error('No Network Found');
    }
  }
}

class FeedbackService {
  static Future sendFeeback(
      {required String? subject, required String? description}) async {
    print("We are here");
    print(subject);
    print(description);
    // var variable = DateTime.now();
    // String dateOnly = variable.();
    String userToken =
        await TokenSharedPrefernces.instance.getTokenValue("token");
    print('USER TOKEN: $userToken');
    Map<String, String> headers = {
      "Authorization": "Token ${userToken}",
    };
    final feebackUrl = Uri.parse('${FypEnv.POST_FEEDBACK_URL_PREFIX}');
    final response = await http.post(
      feebackUrl,
      headers: headers,
      body: {'subject': '$subject', 'description': '$description'},
    );

    print(response.statusCode as int);

    if ((response.statusCode as int) == 200) {
      print(response.body);
      return response.body;
    }

    return null;
  }
}

class LoginService {
  static Future login(email, password) async {
    final String loginURL = FypEnv.LOGIN_URL_PREFIX;
    var requestBody = {'username': '$email', 'password': '$password'};
    var decodedResponse;
    //sending API request for login
    final response = await http.post(Uri.parse(loginURL),
        headers: <String, String>{
          'Content_Type': 'application/json',
        },
        body: requestBody);
    //if the login is successful
    if (response.statusCode == 200) {
      decodedResponse = json.decode(response.body);

      var tokenSession = decodedResponse['token'];
      TokenSharedPrefernces.instance.setTokenValue("token", tokenSession);
      print(tokenSession);

      return decodedResponse;
    }
    //if the login is unseccessful
    return null;
  }
}

class RegisterService {
  static Future register(fullName, phoneNumber, email, password) async {
    var requestBody = {
      'email': '$email',
      'user_name': '$fullName',
      'phone_number': '$phoneNumber',
      'password': '$password'
    };
    var decodedResponse;
    //sending API request for register
    final response = await http.post(Uri.parse(FypEnv.REGISTER_URL_PREFIX),
        headers: <String, String>{
          'Content_Type': 'application/json',
        },
        body: requestBody);
    print("Hi----------");
    //if register is successful
    print(response.statusCode);
    if (response.statusCode == 201) {
      decodedResponse = json.decode(response.body);
      return decodedResponse;
    }
    return null;
  }
}

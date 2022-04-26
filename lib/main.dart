import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:nepalbhasafyp/Screens/Home%20Screen/home.dart';
import 'Network/token_shared_preferences.dart';
import 'Screens/Login Screen/login.dart';
import 'package:flutter/material.dart';
import 'package:native_notify/native_notify.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NativeNotify.initialize(
    526,
    'faiy91vGGKWPAC160cvUOB',
    'AAAAaMDXaII:APA91bG79Vtiq2V3ojAkqNSeNLMM7Cp9Ivylcw8Patf1nxyzYgJJ3U79Z0RlY4aPEhE5Skq5sXH0nkOHQ4vTZmQZEC4EaSVqwBdsAHvur0XbvKp08VtjaMDbbCA1SSVudciXv0XlgzDI',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nepal Bhasa Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const loginPage(),
    );
  }
}

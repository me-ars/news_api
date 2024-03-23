import 'package:flutter/material.dart';
import 'package:news/pages/Home.dart';
import 'package:news/pages/WebView.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import 'pages/Login.dart';

main() {
  runApp(MaterialApp(
    themeMode: ThemeMode.system,
    darkTheme: ThemeData(
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStateProperty.all(Colors.orange))),
        scaffoldBackgroundColor: Color(
          0xff111111,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(
            0xff111111,
          ),
        )),
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    theme: ThemeData(
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStateProperty.all(Colors.orange))),
        scaffoldBackgroundColor: Color(0xffe5e5e5)),
  ));
}

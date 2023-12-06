import 'package:flutter/material.dart';
bool kIsDarkMode = false;

final kLightTheme = ThemeData(
  primarySwatch: Colors.yellow,
);
final kDarkTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.dark,
);
const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 14,
);
const TextStyle kReadMoreTextStyle = TextStyle(
  color: Colors.blue,
  fontWeight: FontWeight.bold,
);
const kApiKey = '71c117b96d1f46dcba380a95aa14d8cd';
const kNewsApiURL = 'https://newsapi.org/v2/top-headlines';


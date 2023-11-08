import 'package:flutter/material.dart';
bool isDarkMode = false;

final lightTheme = ThemeData(
  primarySwatch: Colors.yellow,
);
final darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.dark,
);
const kApiKey = '71c117b96d1f46dcba380a95aa14d8cd';
const kNewsApiURL = 'https://newsapi.org/v2/top-headlines';


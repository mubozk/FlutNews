import 'package:flutter/material.dart';
bool isDarkMode = false;

final lightTheme = ThemeData(
  primarySwatch: Colors.yellow,
);
final darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.dark,
);
const kApiKey = '';
const kNewsApiURL = 'https://newsapi.org/v2/top-headlines';


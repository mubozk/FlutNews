import 'package:flut_news/models/news_article.dart';
import 'package:flut_news/screens/home_screen.dart';
import 'package:flut_news/screens/loading_screen.dart';
import 'package:flut_news/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flut_news/utilities/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kIsDarkMode ? kDarkTheme : kLightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
    /*  MainScreen(locationNews: [             API DE PROBLEM OLDUĞU İÇİN DENEME AMAÇLI EKLEDİM.
      NewsArticle(
          title: 'selam',
          description: 'dlşadlşşajdalşjd',
          url: 'ksdjakldasdjşlsadlsşş')
    ]); */
  }
}

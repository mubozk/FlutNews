
import 'package:flut_news/screens/home_screen.dart';
import 'package:flut_news/screens/loading_screen.dart';
import 'package:flut_news/screens/theme_test_screen.dart';
import 'package:flut_news/services/news.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
// test
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'LoadingScreen' ,
      routes: {
        'LoadingScreen' : (context) => LoadingScreen(),
        'ThemeScreen': (context) => ThemeTestScreen(),
        'HomeScreen': (context) => HomeScreen(),
      },
    );
  }
}

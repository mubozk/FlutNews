import 'package:flut_news/screens/home_screen.dart';
import 'package:flut_news/services/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flut_news/services/location.dart';
import 'package:flut_news/utilities/country_code_converter.dart';
import 'package:flut_news/models/news_article.dart';
import 'package:flut_news/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}
Location location = Location();
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  void getNewsData() async {
    var currentCountry = await location.getCurrentCountry(context);
    currentCountry = currentCountry.toLowerCase();
    var countryCode = countryCodeFromCountryName(currentCountry);
    var newsData = await NewsModel().getNews(countryCode);
    List<NewsArticle> articles = (newsData['articles'] as List)
        .map((articleJson) => NewsArticle.fromJson(articleJson))
        .toList();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MainScreen(locationNews: articles);
    }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.purple,
          size: 100.0,
        ),
      ),
    );
  }
}

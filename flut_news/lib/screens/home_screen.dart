import 'package:flutter/material.dart';
import 'package:flut_news/models/news_article.dart';
import 'package:flut_news/components/clip_news.dart';
import 'package:flut_news/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  final List<NewsArticle> locationNews;
  const HomeScreen({Key? key, required this.locationNews}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kIsDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: kIsDarkMode ? Colors.black : Colors.white,
        title: Text("FlutNews", style: TextStyle(fontFamily: 'PlayfairDisplay'),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          NewsArticle article = widget.locationNews[index];
          return Padding(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 5),
            child: ClipNews(
              url: article.url,
              title: article.title,
              body: article.description,
            ),
          );
        },
        itemCount: widget.locationNews.length,
      ),
    );
  }
}

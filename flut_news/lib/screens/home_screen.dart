import 'package:flutter/material.dart';
import 'package:flut_news/models/news_article.dart';
import 'package:flut_news/components/clip_news.dart';

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
      appBar: AppBar(
        title: Text("Table Layout"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          NewsArticle article = widget.locationNews[index];
          return Padding(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 5),
            child: ClipNews(
              isDarkMode: false, // Set your dark mode condition
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

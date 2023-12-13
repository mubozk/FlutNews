import 'package:flutter/material.dart';
import 'package:flut_news/models/news_article.dart';
import 'package:flut_news/components/clip_news.dart';
import 'package:flut_news/utilities/constants.dart';

class NewsListScreen extends StatelessWidget {
  final Map<String, dynamic> newsData; // Changed to Map
  final String category;

  NewsListScreen({required this.newsData, required this.category});

  @override
  Widget build(BuildContext context) {
    List<NewsArticle> articles = (newsData['articles'] as List)
        .map((articleJson) => NewsArticle.fromJson(articleJson))
        .toList();

    return Scaffold(
      backgroundColor: kIsDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: kIsDarkMode ? Colors.black : Colors.white,
        title: Text(category),

      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          NewsArticle article = articles[index];
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: ClipNews(
              title: article.title,
              body: article.description,
            ),
          );
        },
      ),
    );
  }
}

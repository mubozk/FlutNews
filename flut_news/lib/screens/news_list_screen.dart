import 'package:flutter/material.dart';
import 'package:flut_news/models/news_article.dart';
import 'package:flut_news/components/clip_news.dart';
import 'package:flut_news/utilities/constants.dart';

class NewsListScreen extends StatefulWidget {
  final Map<String, dynamic> newsData; // Changed to Map
  final String category;

  const NewsListScreen(
      {super.key, required this.newsData, required this.category});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    List<NewsArticle> articles = (widget.newsData['articles'] as List)
        .map((articleJson) => NewsArticle.fromJson(articleJson))
        .toList();

    return ValueListenableBuilder(
        valueListenable: kIsDarkModeNotifier,
        builder: (context, bool isDarkMode, _) {
          return Scaffold(
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(
                  color: isDarkMode ? Colors.teal : Colors.yellow),
              backgroundColor: isDarkMode ? Colors.black : Colors.white,
              title: Text(
                "FlutNews",
                style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    color: isDarkMode == false
                        ? const Color.fromARGB(255, 233, 218, 90)
                        : Colors.teal),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    kIsDarkModeNotifier.value = !kIsDarkModeNotifier.value;
                  },
                  icon: Icon(
                    isDarkMode == false ? Icons.dark_mode : Icons.light_mode,
                    color: isDarkMode == false ? Colors.grey : Colors.yellow,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                NewsArticle article = articles[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipNews(
                    url: article.url,
                    title: article.title,
                    body: article.description,
                  ),
                );
              },
            ),
          );
        });
  }
}

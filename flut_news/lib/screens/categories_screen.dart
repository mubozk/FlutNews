import 'package:flut_news/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flut_news/services/news.dart'; // Import NewsModel
import 'package:flut_news/screens/news_list_screen.dart';
import 'package:flut_news/models/news_article.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<String> categories = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology",
  ];

  void navigateToNewsListScreen(String category) async {
    var newsData = await NewsModel().getNewsByCategory(category);
    if (newsData != null && newsData['articles'] is List) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NewsListScreen(newsData: newsData, category: category); // Pass the whole response
      }));
    } else {
      print('No or invalid news data for category: $category');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kIsDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: kIsDarkMode ? Colors.black : Colors.white,
        title: Text("News Categories"),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () async {
              var newsData = await NewsModel().getNewsByCategory(categories[index]);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsListScreen(newsData: newsData, category: categories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

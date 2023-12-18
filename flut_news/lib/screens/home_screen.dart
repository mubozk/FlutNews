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
              automaticallyImplyLeading: false,
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
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        isDarkMode == false
                            ? '../../assets/light_background.jpg'
                            : '../../assets/dark_background.jpg',
                      ))),
              child: ListView.builder(
                itemBuilder: (BuildContext ctx, int index) {
                  NewsArticle article = widget.locationNews[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 5),
                    child: ClipNews(
                      url: article.url,
                      title: article.title,
                      body: article.description,
                    ),
                  );
                },
                itemCount: widget.locationNews.length,
              ),
            ),
          );
        });
  }
}

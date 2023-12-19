import 'package:flut_news/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flut_news/services/news.dart'; // Import NewsModel
import 'package:flut_news/screens/news_list_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

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
        return NewsListScreen(
            newsData: newsData, category: category); // Pass the whole response
      }));
    } else {
      print('No or invalid news data for category: $category');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: kIsDarkModeNotifier,
        builder: (context, bool isDarkMode, _) {
          return Scaffold(
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            appBar: AppBar(
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
                    setState(() {
                      kIsDarkModeNotifier.value = !kIsDarkModeNotifier.value;
                    });
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
                  image: AssetImage(isDarkMode == false
                      ? '../../assets/light_background.jpg'
                      : '../../assets/dark_background.jpg'),
                ),
              ),
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      categories[index],
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    tileColor: isDarkMode ? Colors.grey[850] : Colors.white,
                    onTap: () async {
                      var newsData = await NewsModel()
                          .getNewsByCategory(categories[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsListScreen(
                              newsData: newsData, category: categories[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        });
  }
}

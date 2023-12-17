import 'package:flutter/material.dart';
import 'package:flut_news/screens/home_screen.dart';
import 'package:flut_news/screens/categories_screen.dart'; // Implement this
import 'package:flut_news/utilities/constants.dart';
import 'package:flut_news/models/news_article.dart';

class MainScreen extends StatefulWidget {
  final List<NewsArticle> locationNews;

  const MainScreen({Key? key, required this.locationNews}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  void toggleTheme() {
    setState(() {
      kIsDarkMode = !kIsDarkMode;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(locationNews: widget.locationNews),
      const CategoriesScreen(),
      Container(),
      Container(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        backgroundColor: kIsDarkMode ? Colors.black : Colors.white,
        title: const Text(
          "FlutNews",
          style: TextStyle(fontFamily: 'PlayfairDisplay'),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                kIsDarkMode = !kIsDarkMode;
              });
            },
            icon: Icon(
              kIsDarkMode == false ? Icons.dark_mode : Icons.light_mode,
              color: kIsDarkMode == false ? Colors.grey : Colors.yellow,
            ),
          ),
        ],
      ), */
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(221, 222, 248,
            249), // kIsDarkMode ? Colors.grey[900] : Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {});
          if (index == 3) {
            toggleTheme();
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
          // Additional logic for specific tabs can be implemented here
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars_rounded),
            label: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}

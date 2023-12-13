import 'package:flutter/material.dart';
import 'package:flut_news/screens/categories_screen.dart'; // Ensure this exists
import 'package:flut_news/screens/home_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onThemeToggle;

  CustomAppBar({Key? key, required this.onThemeToggle})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("News App"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(locationNews: [])), // Replace [] with actual news data
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.category),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => CategoriesScreen()), // Ensure CategoriesScreen is defined
            // );
          },
        ),
        IconButton(
          icon: Icon(Icons.brightness_4), // Icon for theme toggle
          onPressed: onThemeToggle,
        ),
        IconButton(
          icon: const Icon(Icons.help_outline),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('About'),
                  content: const SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('This app provides the latest news based on your location and categories.'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}

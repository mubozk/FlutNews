import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDarkMode = false;

  // Define light and dark themes
  final lightTheme = ThemeData(
    primarySwatch: Colors.yellow,
  );

  final darkTheme = ThemeData(
    primarySwatch: Colors.teal,
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = isDarkMode ? darkTheme : lightTheme;

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme Change Example'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: isDarkMode
                    ? AssetImage('assets/dark_background.jpg')
                    : AssetImage('assets/light_background.jpg'),
                fit: BoxFit.fill),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: toggleTheme,
                  child: Text(isDarkMode
                      ? 'Switch to Light Theme'
                      : 'Switch to Dark Theme'),
                ),
                Text(
                  'Current Theme: ${isDarkMode ? 'Dark' : 'Light'}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(const NewsApp());

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  var containerColor = Colors.yellowAccent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigoAccent[100],
            appBar: AppBar(
              title: const Text('NewsApp', style: TextStyle(fontSize: 18)),
              backgroundColor: Colors.lightBlueAccent[100],
              centerTitle: true,
            ),
            body: InkWell(
                onTap: () {
                  setState(() {
                    if (containerColor == Colors.yellowAccent) {
                      containerColor = Colors.blueAccent;
                    } else {
                      containerColor = Colors.yellowAccent;
                    }
                  });
                },
                child: Container(
                    color: containerColor,
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Click on me to change my color!',
                      style: TextStyle(fontSize: 20),
                    )
                )
            )
        ),
    );
  }
}
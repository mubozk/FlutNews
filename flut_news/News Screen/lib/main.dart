import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent[100],
      appBar: AppBar(
        title: const Text('NewsApp', style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.lightBlueAccent[100],
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Click to check the news!',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    backgroundColor: Colors.indigoAccent[100],
                    appBar: AppBar(
                      title: const Text('Göçe Karşı Nobellik Örnek', style: TextStyle(fontSize: 18)),
                      backgroundColor: Colors.lightBlueAccent[100],
                      centerTitle: true,
                    ),
                    body: Container(
                      alignment: Alignment.center,
                        child: const Column(
                          children: [
                            Text(
                              'Türk Kızılayı, Nobel Ödüllü "Mikro Kredi" projesinin bir benzerini Afganların yasadışı göçünü önlemek için hayata geçirdi.',
                              style: TextStyle(fontSize: 18
                              ),
                            ),
                            Image(image: AssetImage('assets/news_snippet.png')),
                          ],
                      ),
                    ),
                  );
                },
              ));
            },

          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to the NewsApp! Click the button on top right to check the news!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
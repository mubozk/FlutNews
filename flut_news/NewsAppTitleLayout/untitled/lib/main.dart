import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.indigo[800],
          title: Text('News App', style: TextStyle(color: Colors.red, fontFamily: 'Roboto')),
          centerTitle: true,
        ),
        body: Center(
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/tr/8/84/Milli_Gazete_26_Aral%C4%B1k_2017.jpg'
          )
        )
      ),
    ),
  );
}


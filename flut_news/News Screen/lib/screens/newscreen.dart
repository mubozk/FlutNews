import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigoAccent[100],
        appBar: AppBar(
          title: const Text('Göçe Karşı Nobellik Örnek', style: TextStyle(fontSize: 18)),
          backgroundColor: Colors.lightBlueAccent[100],
          centerTitle: true,
        ),
          body: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
          )
      ),
    );
  }
}

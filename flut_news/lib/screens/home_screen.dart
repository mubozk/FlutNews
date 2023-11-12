import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List images = [
    "https://images.wallpaperscraft.com/image/single/forest_man_loneliness_116306_1280x960.jpg",
    "https://images.wallpaperscraft.com/image/single/landscape_mountains_sun_140434_1280x960.jpg",
    "https://images.wallpaperscraft.com/image/single/ocean_beach_aerial_view_134429_1280x960.jpg",
    "https://images.wallpaperscraft.com/image/single/lavender_field_starry_sky_123482_1280x960.jpg",
    "https://images.wallpaperscraft.com/image/single/mountains_lake_tops_119133_1280x960.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table Layout"),
      ),
      body: ListView.builder(itemBuilder: (BuildContext ctx, int index){
        return Padding(
          padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Image.network(images[index]),
                  SizedBox(height: 20),
                ],
              ),
            );
      },
      itemCount: images.length,
      )
    );
  }
}

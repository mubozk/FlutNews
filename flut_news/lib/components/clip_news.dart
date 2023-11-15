import 'package:flutter/material.dart';

class ClipNews extends StatelessWidget {
  final bool isDarkMode;
  final String title;
  final String body;

  const ClipNews({
    Key? key,
    required this.isDarkMode,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Increased height to accommodate the 'Read More' button
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.teal.withOpacity(0.7) : Colors.yellow.withOpacity(0.7),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            spreadRadius: 5,
            blurRadius: 10,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
        gradient: LinearGradient(
          colors: isDarkMode
              ? [
            const Color.fromARGB(255, 4, 170, 153).withOpacity(0.5),
            const Color.fromARGB(255, 3, 190, 171).withOpacity(0.5),
            const Color.fromARGB(255, 1, 119, 107).withOpacity(0.5),
          ]
              : [
            const Color.fromARGB(255, 238, 222, 81).withOpacity(0.5),
            const Color.fromARGB(255, 248, 232, 91).withOpacity(0.5),
            const Color.fromARGB(255, 243, 223, 42).withOpacity(0.5)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Text(
                body,
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle 'Read More' button click
              },
              child: Text(
                'Read More',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

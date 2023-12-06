import 'package:flutter/material.dart';
import 'package:flut_news/utilities/constants.dart';
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
      height: 200,
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
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: kTitleTextStyle.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Expanded(
              child: Text(
                body,
                style: kBodyTextStyle.copyWith(
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
                style: kReadMoreTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

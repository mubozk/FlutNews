import 'package:flutter/material.dart';
import 'package:flut_news/utilities/constants.dart';
import 'package:flut_news/screens/news_webview_screen.dart';

class ClipNews extends StatelessWidget {
  final String title;
  final String body;
  final String url;

  const ClipNews({
    Key? key,
    required this.title,
    required this.body,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: kIsDarkModeNotifier,
        builder: (context, bool isDarkMode, _) {
          return Container(
            height: 200,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.teal.withOpacity(0.7)
                  : Colors.yellow.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
              gradient: LinearGradient(
                colors: isDarkMode
                    ? [
                        Colors.teal.shade700,
                        Colors.teal.shade500,
                        Colors.teal.shade300
                      ]
                    : [
                        Colors.yellow.shade800,
                        Colors.yellow.shade600,
                        Colors.yellow.shade400
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.9)
                            : Colors.black.withOpacity(0.9),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsWebViewScreen(url: url),
                          ),
                        );
                      },
                      child: Text(
                        'Read More',
                        style: kReadMoreTextStyle.copyWith(
                          color: isDarkMode
                              ? Colors.lightBlueAccent
                              : Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

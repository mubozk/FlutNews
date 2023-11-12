import 'package:flutter/material.dart';

class clip_news extends StatelessWidget {
  const clip_news({
    super.key,
    required this.isDarkMode,
  });
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.teal : Colors.yellow,
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
                  const Color.fromARGB(255, 4, 170, 153),
                  const Color.fromARGB(255, 3, 190, 171),
                  const Color.fromARGB(255, 1, 119, 107)
                ]
              : [
                  const Color.fromARGB(255, 238, 222, 81),
                  const Color.fromARGB(255, 248, 232, 91),
                  const Color.fromARGB(255, 243, 223, 42)
                ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("başlik"),
          const Text("body"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text("read more")),
            ],
          )
        ],
      ),
    );
  }
}

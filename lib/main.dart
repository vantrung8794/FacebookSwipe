import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final List<String> listItems = [
  "images/img1.jpeg",
  "images/img2.jpeg",
  "images/img3.png",
  "images/img4.jpeg"
];

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController =
      PageController(viewportFraction: 1, keepPage: true);
  double page = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      print(pageController.page);
      setState(() {
        page = pageController.page ?? 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Get width of parrents
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
          controller: pageController,
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            final percent = index - page;
            return Transform.rotate(
              angle: percent / 4.0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Transform.translate(
                    offset: Offset(percent * constraints.maxWidth / 3.5, 0.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 60.0),
                      child: Image(
                        image: AssetImage(listItems[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}

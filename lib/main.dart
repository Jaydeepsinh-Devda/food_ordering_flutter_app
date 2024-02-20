import 'package:flutter/material.dart';
import 'package:test_app2/pages/home_page.dart';
import 'package:test_app2/pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        HomePage.tag: (context) => const HomePage(),
        ItemPage.tag: (context) => const ItemPage()
      },
    );
  }
}

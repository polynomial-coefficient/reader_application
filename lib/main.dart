import 'package:flutter/material.dart';
import 'package:reader_application/pages/book_shelf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Reader App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BookShelf(),
    );
  }
}

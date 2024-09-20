import 'package:flutter/material.dart';
import 'pages/get_started_page.dart';
import 'pages/get_started_page.dart'; // Import your GetStartedPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laundry Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetStartedPage(), // Use the GetStartedPage without onThemeChanged
    );
  }
}

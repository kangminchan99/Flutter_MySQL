import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
  KakaoContext.clientId = '0bbb8627599c1198a2cd41317f240032';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

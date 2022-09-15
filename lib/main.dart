import 'package:flutter/material.dart';
import 'package:medicine/View/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Medicine",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const LoginPage(),
    );
  }
}

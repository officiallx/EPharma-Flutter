import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medicine/View/login.dart';

import 'Styles/appcolor.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ripple
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.black38
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskType = EasyLoadingMaskType.black
    ..maskColor = Colors.transparent
    ..indicatorColor = AppColor.primary
    ..textStyle = const TextStyle(
      fontFamily: 'productSans',
      color: Colors.white,
    )
    ..userInteractions = false
    ..fontSize = 12
    ..indicatorSize = 20.0
    ..dismissOnTap = false;
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
      builder: EasyLoading.init(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_user/home.dart';
import 'pages/login_page.dart';
import 'package:get/get.dart';
//import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: MyLogin(), getPages: [
      GetPage(name: '/', page: () => MyLogin()),
      GetPage(name: '/home', arguments: "home page", page: () => Home()),
    ]);
  }
}

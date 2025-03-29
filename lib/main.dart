// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_sqflite/models/transaction_model.dart';
import 'package:flutter_sqflite/routes/app_routes.dart';
import 'package:flutter_sqflite/screens/create_screen.dart';
import 'package:flutter_sqflite/screens/home_screen.dart';
import 'package:flutter_sqflite/screens/update_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EzMony',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    );
  }
}

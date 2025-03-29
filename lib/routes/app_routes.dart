import 'package:flutter_sqflite/screens/create_screen.dart';
import 'package:flutter_sqflite/screens/home_screen.dart';
import 'package:flutter_sqflite/screens/update_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/home';
  static const String create = '/create';
  static const String update = '/update';

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: create, page: () => CreateScreen()),
    // GetPage(name: update, page: () => const UpdateScreen()),
  ];
}

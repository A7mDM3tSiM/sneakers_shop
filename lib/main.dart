import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/utils/theme.dart';
import 'package:sneakers/views/cart_screen.dart';
import 'views/home_screen.dart';
import 'views/details_screen.dart';
import 'utils/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      initialRoute: '/',
      theme: lightTheme,
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/details', page: () => DetailsScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
      ],
    );
  }
}

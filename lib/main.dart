import 'package:flutter/material.dart';
import 'package:platzi_store/presentation/create_product/create_product_screen.dart';
import 'package:platzi_store/presentation/detail_product/detail_product_screen.dart';
import 'package:platzi_store/presentation/home/home_screen.dart';
import 'package:platzi_store/presentation/login/login_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/detail-product': (context) => DetailProductScreen(),
        '/create-product': (context) => CreateProductScreen(),
      },
    );
  }
}

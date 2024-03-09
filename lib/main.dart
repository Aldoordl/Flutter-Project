import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/shop.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
// import 'package:flutter_application_1/pages/dewa_termo.dart';
import 'package:provider/provider.dart';
import 'pages/intro_page.dart';
import 'pages/termo_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=> Shop(),
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const DewaTermo(),
      home: const TermoPage(),
      // home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}

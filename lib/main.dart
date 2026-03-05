import 'package:flutter/material.dart';
import 'package:ujikom_zaidan_arz_arkham_kny/pages/home_page.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BIS',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        overscroll: false,
      ),

      // 🔑 INI YANG BIKIN MOBILE & WEB AMAN
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);

        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaleFactor: 1.0, // cegah teks kebesaran (overflow)
          ),
          child: SafeArea(
            child: child!,
          ),
        );
      },

      home: const HomePage(),
    );
  }
}

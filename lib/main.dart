import 'package:flutter/material.dart';
import 'package:samachaar/screens/landing_screen.dart';

import 'constant/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Samachaar',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        appBarTheme: const AppBarTheme(color: appBarColor),
      ),
      home: const LandingScreen(),
    );
  }
}

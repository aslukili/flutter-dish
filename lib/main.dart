import 'package:flutter/material.dart';
import 'package:flutter_dish/config/config.dart';
import 'package:flutter_dish/screens/home.dart';
import 'package:flutter_dish/screens/splashScreen.dart';
import 'package:flutter_dish/widgets/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "brandon",
        primaryColor: Config.colors.primaryColor,
        primarySwatch: Colors.blue,
      ),
      home: const SplashWidget(
        child: SplashScreen(),
        nextPage: Home(),
        time: 120,
      ),
    );
  }
}



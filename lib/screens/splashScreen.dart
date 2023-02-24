import 'package:flutter/material.dart';
import 'package:flutter_dish/config/config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(Config.assets.splashImg), Container(
            height: 40,
            width: 190,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Config.colors.primaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15))
            ),
            child: Text("flutter dish", style: TextStyle(color: Colors.white, fontSize: 24),),
          )],
        ),
      ),
    );
  }
}


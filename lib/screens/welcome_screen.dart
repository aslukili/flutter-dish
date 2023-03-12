import 'package:flutter/material.dart';
import 'package:flutter_dish/screens/home_screen.dart';
import 'package:flutter_dish/widgets/navbar_roots.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 75,
            ),
            Padding(
              padding: EdgeInsets.all(
                20,
              ),
              child: Image.asset("assets/images/basket_of_fruits1.png"),
            ),
            SizedBox(height: 50),
            Text(
              "Flutter Dishes",
              style: TextStyle(
                  color: Color(0xFF7165D6),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
            SizedBox(height: 10),
            Text(
              "Choose your meal",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 60),
            Material(
              color: Color(0xFF7165D6),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

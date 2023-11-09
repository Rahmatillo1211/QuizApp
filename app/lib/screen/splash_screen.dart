import 'package:app/screen/category.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(
    const MaterialApp(
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CategoryScreen()),
        );
      },
    );

    return Scaffold(
      backgroundColor: const Color(0xFF9F7FFF),
      body: _buidBody(context),
    );
  }

  _buidBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "images/img/q_m.png",
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome to",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "QuizApp",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

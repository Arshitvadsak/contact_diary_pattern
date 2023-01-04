import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _Page1State();
}

class _Page1State extends State<Splash> {
  @override
  void initState() {
    super.initState();

    changeScreen();
  }

  changeScreen() {
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const home(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Container(
              child: Icon(Icons.cabin_outlined,size: 300),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.black54,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Colors.teal,
    );
  }
}

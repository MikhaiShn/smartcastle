

import 'package:flutter/material.dart';
import 'package:flutter_application_6/shopLogIn.dart';

class ShopSplash extends StatefulWidget {
  const ShopSplash({super.key});

  @override
  State<ShopSplash> createState() => _SplashState();
}

class _SplashState extends State<ShopSplash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShopLogIn()), // Navigate to NextScreen after 5 seconds
      );
    });
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
                image: AssetImage('aaaa/assets/splash.jpeg'), // Provide your image path here
                fit: BoxFit.cover, // Set fit property to cover the container
              ),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        
      ),
    );
  }
}
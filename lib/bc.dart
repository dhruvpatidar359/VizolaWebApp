import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Navbar'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/background.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust the sigma values for blur intensity
              child: Container(
                color: Colors.black.withOpacity(0.5), // Adjust the opacity as desired
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  // Add your content widgets here
                  SizedBox(height: 20),
                  Text(
                    'Your Content',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  // Add more content widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

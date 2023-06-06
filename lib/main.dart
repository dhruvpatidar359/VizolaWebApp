import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Remove 'styles.dart' import
// Add this import



import 'home.dart';

Future<void> main() async {

    WidgetsFlutterBinding.ensureInitialized();
    // setWindowMinSize(const Size(800, 500));

  Animate.restartOnHotReload = true;
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    // Edit from here...

     NextGenApp(sharedPreferences: sharedPreferences,),

  );
}

class NextGenApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const NextGenApp({  Key? key,
    required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Home(), // Replace with this widget
    );
  }
}

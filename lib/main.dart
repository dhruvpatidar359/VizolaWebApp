import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// Remove 'styles.dart' import
// Add this import
import 'package:provider/provider.dart';

import 'assets.dart';
import 'home.dart';

void main() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    // setWindowMinSize(const Size(800, 500));
  }
  Animate.restartOnHotReload = true;
  runApp(
    // Edit from here...
    FutureProvider<FragmentPrograms?>(
      create: (context) => loadFragmentPrograms(),
      initialData: null,
      child: const NextGenApp(),
    ),
  );
}

class NextGenApp extends StatelessWidget {
  const NextGenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Home(), // Replace with this widget
    );
  }
}

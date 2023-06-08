import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webapp/pages/login.dart';

// Remove 'styles.dart' import
// Add this import

import 'firebase_options.dart';
import 'home.dart';

Future<void> main() async {
// some of the initial initializations in the webapp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // setWindowMinSize(const Size(800, 500));

  Animate.restartOnHotReload = true;
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(
    // Edit from here...

    NextGenApp(
      sharedPreferences: sharedPreferences,
    ),
  );
}

class NextGenApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const NextGenApp({Key? key, required this.sharedPreferences})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: "/login",
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: LoginPage(),
        );
      },

    )

  ],


);


class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
    transitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (_, animation, __, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(1.5, 0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.ease),
          ),
        ),
        child: child,
      );
    },
  );
}
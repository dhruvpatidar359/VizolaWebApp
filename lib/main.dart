import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webapp/features/SecHome/presentation/classScreen.dart';
import 'package:webapp/features/auth/presentation/sign_in.dart';

// Remove 'styles.dart' import
// Add this import

import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/data/repositories/auth_repositories.dart';
import 'firebase_options.dart';
import 'features/Landing/home.dart';

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

  // TO-DO to change the icon of sign in , if already logged in
  bool result = await authRepositoryInstance.isLoggedIn();

  runApp(
    // Edit from here...

    VizolaWebApp(
      sharedPreferences: sharedPreferences,
    ),
  );
}

class VizolaWebApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;

  const VizolaWebApp({Key? key, required this.sharedPreferences})
      : super(key: key);

  @override
  State<VizolaWebApp> createState() => _VizolaWebAppState();
}

class _VizolaWebAppState extends State<VizolaWebApp> {
  // @override
  // void initState()  {
  //   super.initState();
  //    authRepositoryInstance.getUser();
  // }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: MaterialApp.router(
           debugShowCheckedModeBanner: false,
          routerConfig: _router,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(brightness: Brightness.dark),
        ),
      ),
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
      path: "/signin",
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: SigninPage(),
        );
      },
    ),
    GoRoute(
      path: "/CreatorHome",
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: ClassScreen(),
        );
      },
    ),
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

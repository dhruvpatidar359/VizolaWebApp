import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

AuthRepository authRepositoryInstance = AuthRepository();

class Singleton {}

class AuthRepository {
  static final AuthRepository _singleton = AuthRepository._internal();

  factory AuthRepository() {
    return _singleton;
  }

  AuthRepository._internal();

  final _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String? name;
  String? imageUrl;
  String? uid;
  String? userEmail;

  Future<void> signOut() async {
    print("sign out function");
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);

    uid = null;
    name = null;
    userEmail = null;
    imageUrl = null;

    log("User signed out of Google account");
  }

  Future<User?> signInWithGoogle() async {
    User? user;

    // The `GoogleAuthProvider` can only be used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithPopup(authProvider);

      user = userCredential.user;
    } catch (e) {
      log(e.toString());
    }

    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
    }

    return user;
  }

  Future<bool> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;

    final User? user = _firebaseAuth.currentUser;

    if (authSignedIn && user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
      return true;
    }

    return false;
  }

  Future<bool> isLoggedIn() async {
    // Check the user's login status using your authentication mechanism
    // Return true if the user is logged in, false otherwise
    // Example with Firebase Authentication:
    final User? user = _firebaseAuth.currentUser;

    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
      return true;
    }

    return false;
  }
}

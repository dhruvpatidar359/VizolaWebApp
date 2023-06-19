import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

AuthRepository authRepositoryInstance = AuthRepository();
final firestoreInstance = FirebaseFirestore.instance;

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
  String? role;


  Future<void> signOut() async {
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);

    uid = null;
    name = null;
    userEmail = null;
    imageUrl = null;
    role = null;
  
    // print(name);
    log("User signed out of Google account");
  }

  Future<List<QueryDocumentSnapshot>> checkUserExists(String? uid) async {
    // Get a reference to the Firestore collection containing user data
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Query the collection to check if a document with the given UID exists
    QuerySnapshot querySnapshot =
        await usersCollection.where('uid', isEqualTo: uid).get();

    // Return the list of documents with the given UID
    return querySnapshot.docs;
  }

  Future<User?> signInWithGoogle(bool isSME) async {
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

      final isUserExistsDocs = await checkUserExists(uid);
// print('user is colliding');
      if (isUserExistsDocs.isNotEmpty) {
        // User already exists
        QueryDocumentSnapshot userSnapshot = isUserExistsDocs.first;
        bool isUserSME = userSnapshot.get('isSME') ?? false;

        if (isSME == isUserSME) {
          print('loggedin');


          // same as below
          if(isSME == true) {
            role = 'SME';
          } else {
            role = '3D Animator';
          }
          // User is an SME and matches the signed-in user
          // Perform necessary actions for an SME
        } else {
          // User is not an SME or does not match the signed-in user

        print("logged in but signing out as role mismatch");
          await signOut();
          // Perform necessary actions (e.g., show error message)
        }
      } else {

        // User does not exist
        // Create a new document for the user in Firestore
        print("creating a collection for the user");

        await firestoreInstance.collection('users').doc(uid).set({
          'isSME': isSME,
          'email': userEmail,
          'name': name,
          'uid': uid,
        });

        // for assigning the role to the user
        if(isSME == true) {
          role = 'SME';
        } else {
          role = '3D Animator';
        }

      }
    }


    return user;
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

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:webapp/colors.dart';

import '../constants.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _handleLogin(bool isContentDeveloper) async {
    GoogleSignInAccount? user = await _googleSignIn.signIn();
    if (user != null) {
      // Perform any additional login logic based on the user's rolef
      if (isContentDeveloper) {
        // Handle content developer login
      } else {
        // Handle modeler login
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        gradient: LinearGradient(
          colors: [
            // Colors.blue[900]!,
            Colors.black,
            Colors.black,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child:  Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(text :  '3D Animator',image :  modeler,onPressed:  () {}),
              SizedBox(height: 16),
              SizedBox(height: 16),
              CustomCard(text : 'SME', image :contentwriter,onPressed:  () {})
            ],
          ),
        ),

    );
  }
}

class CustomCard extends StatefulWidget {
  final String text;
  final String image;
  final VoidCallback onPressed;

  CustomCard({required this.text, required this.image, required this.onPressed});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(

      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Card(
          elevation: isHovered ? 50 : 0, // Adjust the elevation values as per your preference
          shadowColor: Colors.yellowAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                colors: [
                  // Colors.blue[900]!,
                  Colors.black,
                  Colors.black,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.width * 0.095),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(right: 10.0),
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.buttons),
                      ),
                      onPressed: widget.onPressed,
                      icon: Icon(Icons.login),
                      label: Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

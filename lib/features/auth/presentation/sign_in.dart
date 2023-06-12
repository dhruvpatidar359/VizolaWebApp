import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webapp/features/Landing/home.dart';
import 'package:webapp/features/auth/data/repositories/auth_repositories.dart';

import '../../../Constants/constants.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_events.dart';
import '../bloc/auth_state.dart';

final AuthBloc authBloc = AuthBloc(authRepository: AuthRepository());

class LoginPage extends StatelessWidget {
  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        // TODO: implement listener
        if (state is Authenticated) {
          // Navigating to the dashboard screen if the user is authenticated
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        }
        if (state is AuthError) {
          // Showing the error message if the user has entered invalid credentials
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UnAuthenticated) {
          // Showing the sign in form if the user is not authenticated

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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign in with your google account",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCard(
                          text: '3D Animator',
                          image: modeler,
                          onPressed: () {
                            _authenticateWithGoogle(context);
                          }),
                      SizedBox(height: 16),
                      SizedBox(height: 16),
                      CustomCard(
                          text: 'SME',
                          image: contentwriter,
                          onPressed: () {
                            _authenticateWithGoogle(context);
                          })
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return Container(child: Text("404"));
      },
    );
  }
}

class CustomCard extends StatefulWidget {
  final String text;
  final String image;
  final VoidCallback onPressed;

  CustomCard(
      {required this.text, required this.image, required this.onPressed});

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
          elevation: isHovered
              ? 100
              : 0, // Adjust the elevation values as per your preference
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
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.buttons),
                      ),
                      onPressed: widget.onPressed,
                      icon: Icon(Icons.login),
                      label: Text('Sign in'),
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

import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:go_router/go_router.dart';
import 'package:webapp/features/Landing/bars/navbar/bloc/navbar_bloc.dart';
import 'package:webapp/features/Landing/bars/navbar/bloc/navbar_event.dart';
import 'package:webapp/features/Landing/bars/navbar/bloc/navbar_state.dart';
import 'package:webapp/Constants/constants.dart';
import 'package:webapp/features/auth/data/repositories/auth_repositories.dart';

final NavBarBloc navbloc = NavBarBloc();

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Emit the authenticated state when the home screen becomes visible again
    navbloc.add(NavBarAuthenticatedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavBarBloc, NavBarState>(
      bloc: navbloc,
      listenWhen: (previous, current) => current is NavBarActionState,
      buildWhen: (previous, current) => current is! NavBarActionState,
      listener: (context, state) {
        // TODO: implement listener

        if (state is NavBarNavigateToSigninPageState) {
          context.go("/signin");
        }
      },
      builder: (context, state) {
        if (state is NavBarAuthState) {
          return DeskTopNavBar(context, "Sign Out");
        }

        return DeskTopNavBar(context, 'Sign In');
      },
    );
  }
}

Widget DeskTopNavBar(BuildContext context, String authText) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        companyLogo(),
        Row(
          children: [
            navButton('SME'),
            navButton('MODELERS'),
            navButton('ABOUTUS'),
            navButton('FEEDBACK'),
            Container(
              height: 45,
              margin: EdgeInsets.only(right: 10.0),
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.buttons)),
                  onPressed: () {
                    if (authText == 'Sign Out') {
                      navbloc.add(NavBarSignOutClickedEvent());
                    } else {
                      navbloc.add(NavBarNavigateToSigninPageEvent());
                    }
                  },
                  icon: Icon(Icons.login),
                  label: Text(authText)),
            ),
          ],
        ),
      ]));
}

Widget navButton(String text) {
  return Container(
      color: Colors.black54,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {
          // window.alert("dhruv is the best person in the wolrd");
        },
        child: GlowText(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ));
}

Widget companyLogo() {
  return Container(
    width: 150,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Image.asset(
            logo,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );
}

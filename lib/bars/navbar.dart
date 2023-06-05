import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webapp/constants.dart';


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return

    DeskTopNavBar();

  }
}

Widget DeskTopNavBar() {
  return Container(

      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        companyLogo(),
        Row(
          children: [
            navButton('SME'),
            navButton('MODELERS'),
            navButton('ABOUT US'),
            navButton('FEEDBACK'),
          ],
        ),

      ]));
}

Widget navButton(String text) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
          onPressed: () {
            window.alert("dhruv is the best person in the wolrd");
          },
          child:
          Text(text, style: TextStyle(color: Colors.white, fontSize: 18))));
}

Widget companyLogo() {
  return Container(
    width: 150,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(logo), fit: BoxFit.contain)),
  );
}

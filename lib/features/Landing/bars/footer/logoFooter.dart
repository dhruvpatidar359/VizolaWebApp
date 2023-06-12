import 'package:flutter/material.dart';
import 'package:webapp/features/Landing/bars/navbar/navbar.dart';
import 'package:webapp/Constants/constants.dart';

class DesktopFooterColumnOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        companyLogo(),
      ],
    );
  }
}


// class DesktopFooterColumnTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> listColumnTwo = [];
//
//     for (int i = 0; i < socials.length; i++) {
//       listColumnTwo.add(
//         TextButton.icon(
//           onPressed: () => appLaunchUrl(socials[i].socialUrl),
//           icon: Icon(socials[i].socialIcon),
//           label: Text(socials[i].socialAtText),
//         ),
//       );
//     }

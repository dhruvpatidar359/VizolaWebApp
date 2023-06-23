import 'package:flutter/material.dart';

double? h;
double? w;

const String logo = 'assets/images/vizola_logo.png';
const String main_front = 'assets/images/main_front.png';
const String money = 'assets/images/money.png';
const String earth = 'assets/images/earth.png';
const String roboto_font = 'assets/fonts/roboto_font.ttf';
const String modeler = 'assets/images/modeler.png';
const String contentwriter = 'assets/images/contentwriter.png';
const String alpha = 'assets/images/alpha.png';
const String alpha_icon = 'assets/images/alpha_icon.png';
const String beta_icon = 'assets/images/beta_icon.png';
const String gamma_icon = 'assets/images/gamma_icon.png';
const String beta = 'assets/images/beta.png';
const String gamma = 'assets/images/gamma.png';
const String test = 'assets/images/test.png';
const String a = 'assets/images/a.png';
const String b = 'assets/images/b.png';
const String y = 'assets/images/y.png';

// This location is for only content purpose

const String alphaContent = 'Highly rewarding projects which demand greater experience';
const String betaContent = 'Less challenging projects with optimum rewards';
const String gammaContent = 'Bite sized projects for beginners to start with';

List<String> chipLabels = ['Alpha Class', 'Beta Class', 'Gamma Class'];
List<String> classImages = [a, b, y];
List<String> classContents = [alphaContent, betaContent, gammaContent];
List<Pair> classColors = [
  Pair(
      Color(0xFFff0f7b),
      Color(
        0xFFf89b29,
      )),
  Pair(
      Color(0xffdac31a),
      Color(
        0xffe5880a,
      )),
  Pair(
      Color(0xff04daa0),
      Color(
        0xff4ff829,
      )),
];

class AppColors {
  static Color buttons = Color.fromARGB(255, 0, 0, 0);
// static Color cards  = Color.
}

class Pair {
  final Color x;
  final Color y;

  Pair(this.x, this.y);
}

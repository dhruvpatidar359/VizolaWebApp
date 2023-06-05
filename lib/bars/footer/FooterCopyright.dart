import 'package:flutter/material.dart';
import 'package:webapp/constants.dart';

class FooterCopyright extends StatelessWidget {
  const FooterCopyright({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(

      '@Copyright 2023',

      style: TextStyle(
        fontFamily: roboto_font,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

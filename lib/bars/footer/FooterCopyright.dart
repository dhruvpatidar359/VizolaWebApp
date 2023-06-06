import 'package:flutter/material.dart';
import 'package:webapp/constants.dart';

class FooterCopyright extends StatelessWidget {
  const FooterCopyright({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        madeWithLove(),
        const Text(
          '@Copyright 2023',
          style: TextStyle(
            fontFamily: roboto_font,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

Widget madeWithLove() {
  return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Made With "),
        Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        Text(
          ' By Vizola',
        ),
      ]);
}
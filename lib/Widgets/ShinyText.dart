
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class ShinyText extends StatelessWidget {
  const ShinyText({super.key});

  @override
  Widget build(BuildContext context) {
    return  GlowText(
            'GLOW TEXT',
            style: TextStyle(fontSize: 40, color: Colors.white ,fontWeight: FontWeight.bold),
          );

  }
}


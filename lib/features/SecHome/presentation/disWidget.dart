import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../Constants/constants.dart';

class DisWidget extends StatefulWidget {


  final String className;// Index of the selected chip

  const DisWidget({required Key key, required this.className})
      : super(key: key);

  @override
  _DisWidgetState createState() => _DisWidgetState();
}


class _DisWidgetState extends State<DisWidget> {

  void _toogleImage(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.black, // Black color at the bottom

                  // Red color at the top
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,

            ),
        ),
      child: Column(
        children: [
          imageWid(),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.className,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: typedText(),
          ),
        ],
      ),
    );




}


  Widget imageWid() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(alpha),
          )),
    );
  }


  Widget typedText() {
    return SizedBox(
      child: DefaultTextStyle(

        style: const TextStyle(

            fontSize: 20.0, fontFamily: 'Agne', color: Colors.white),
        child: AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            TyperAnimatedText(
                'This is the aplha class,\none of the most easy,\nalso refered as baby.'),
          ],
        ),
      ),
    );
  }
}


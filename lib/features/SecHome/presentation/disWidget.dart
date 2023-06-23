import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aurora/aurora.dart';
import 'package:flutter/material.dart';

import '../../../Constants/constants.dart';

class DisWidget extends StatefulWidget {
  final String className;
  final String image;
  final String content;
  final Pair colorPair;

  const DisWidget({required Key key, required this.className, required this.image, required this.content, required this.colorPair})
      : super(key: key);

  @override
  _DisWidgetState createState() => _DisWidgetState();
}

class _DisWidgetState extends State<DisWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/4,
      child: Stack(

          children: [


            Positioned(
                top: -10,
                left: -100,
                child: Aurora(
                  size: 300,
                  colors: [
                    Color(0x000000).withOpacity(1),
                    Color(0xff64b3f4).withOpacity(1)
                  ],
                )),
            Positioned(
                top: -50,
                right: -50,
                child: Aurora(
                  size: 200,
                  colors: [Color(0x000000), Color(0xFFf7f779)],
                )),
            Positioned(
                bottom: -100,
                right: -300,
                child: Aurora(
                  size: 600,
                  colors: [widget.colorPair.x, widget.colorPair.y],
                )),
            Positioned(
                bottom: -50,
                left: -100,
                child: Aurora(
                  size: 200,
                  colors: [Color(0xFF595cff), Color(0xFFc6f8ff)],
                )),

            Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: typedText(),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget imageWid() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.image),
          )),
    );
  }

  Widget typedText() {
    return SizedBox(

      child: DefaultTextStyle(
        
        style: const TextStyle(
            fontSize: 20.0, fontFamily: 'Agne', color: Colors.white,),
        child: AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            TyperAnimatedText(
                widget.content),
          ],
        ),
      ),
    );
  }
}


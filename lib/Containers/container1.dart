
import 'package:flutter/material.dart';
// import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:morphing_text/morphing_text.dart';
import 'package:scrambletext/scrambletext.dart';
import 'package:webapp/Widgets/tilt.dart';
// import 'package:webapp/fractal_pyramid.dart';


import '../colors.dart';
import '../constants.dart';


class Container1 extends StatefulWidget {
  const Container1({Key? key}) : super(key: key);



  @override
  _Container1State createState() => _Container1State();
}

class _Container1State extends State<Container1> {

  @override
  Widget build(BuildContext context) {
    return

      DesktopContainer1();

  }

  //============== DESKTOP =============

  Widget DesktopContainer1() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w! / 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      'A Platform That\nConnects',
                      style: TextStyle(
                          fontSize: w! / 20,
                          fontWeight: FontWeight.bold,
                          height: 1,


                      ),
                      gradient: LinearGradient(colors:  [
                        Colors.yellow,
                        Colors.amber,
                        Colors.orange,
                        Colors.deepOrange,
                        Colors.cyan,
                        Colors.teal,
                        Colors.green,
                        Colors.lightGreen,
                        Colors.lime,

                      ]),


                    ),
                    ScrambleText(
                      texts: morphedList,
                      style:TextStyle(
                          fontSize: w! / 20,
                          fontWeight: FontWeight.bold,
                          height: 1
                      ),
                      loop: true,
                      words: "!@****#%^&*()",
                      duration: Duration(seconds: 2),
                      charDuraction: Duration(milliseconds: 10),

                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Changing the Way of Teaching',
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 45,
                          child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(AppColors.buttons)),
                              onPressed: () {},
                              icon: Icon(Icons.ads_click),
                              label: Text('Try a Demo')),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '— We belive in YOU',
                          style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              )),
           Expanded(

            child: Container(
              height: 543,


              child:   TiltWidget(
                  yaxis: (MediaQuery.of(context).size.width / 2) / 2,
                  image: main_front,
                  text: '',
                  subText: ''),
            ),
          ),
        ],
      ),
    );
  }
}


class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

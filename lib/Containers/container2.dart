import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';

import 'package:webapp/constants.dart';

import '../colors.dart';
import 'commonContainer.dart';


class Container2 extends StatefulWidget {
  const Container2({Key? key}) : super(key: key);

  @override
  _Container2State createState() => _Container2State();
}

class _Container2State extends State<Container2> {
  @override
  Widget build(BuildContext context) {
    return

      DesktopContainer3();

  }


//=========== DESKTOP ===========
  Widget DesktopContainer3() {
    return CommonContainer(
        'ALWAYS ONLINE',
        'Real-time \nsupport \nwith cloud',
        'Tellus lacus morbi sagittis lacus in. Amet nisl at \nmauris enim accumsan nisi, tincidunt vel. \nEnim ipsum, amet quis ullamcorper eget ut.',
        logo,
        false);
  }

  Widget DesktopContainer2() {
    return Container(
      height: 900,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Expanded(
              child: Stack(
                children: [



                ],
              )
    ),

        ],
      ),
    );
  }

  Widget companyLogo(String image) {
    return Container(
      width: 160,
      height: 36,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}

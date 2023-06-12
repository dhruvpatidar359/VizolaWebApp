import 'package:flutter/material.dart';
import 'package:webapp/Constants/constants.dart';

import 'commonContainer.dart';

class Container3 extends StatefulWidget {
  const Container3({Key? key}) : super(key: key);

  @override
  _Container3State createState() => _Container3State();
}

class _Container3State extends State<Container3> {
  @override
  Widget build(BuildContext context) {

    return DesktopContainer3();
  }

//=========== DESKTOP ===========
  Widget DesktopContainer3() {

    return CommonContainer(
        '',
        'Create Once \n Earn forever',
        'Tellus lacus morbi sagittis lacus in. Amet nisl at \nmauris enim accumsan nisi, tincidunt vel. \nEnim ipsum, amet quis ullamcorper eget ut.',
        money,
        true,context,'Connect AND Earn','We are with you');
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

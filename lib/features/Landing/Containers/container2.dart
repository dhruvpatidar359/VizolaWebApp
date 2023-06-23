import 'package:flutter/material.dart';
import 'package:webapp/Constants/constants.dart';

import 'commonContainer.dart';

class Container2 extends StatefulWidget {
  const Container2({Key? key}) : super(key: key);

  @override
  _Container2State createState() => _Container2State();
}

class _Container2State extends State<Container2> {
  @override
  Widget build(BuildContext context) {

    return DesktopContainer3();
  }

//=========== DESKTOP ===========
  Widget DesktopContainer3() {



    return CommonContainer(
        '',
        'Teach-here \nReach \nEverywhere',
        '',
        earth,
        false,context,'','');
  }


}

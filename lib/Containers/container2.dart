import 'package:flutter/material.dart';
import 'package:webapp/constants.dart';

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
        'ALWAYS ONLINE',
        'Real-time \nsupport \nwith cloud',
        'Tellus lacus morbi sagittis lacus in. Amet nisl at \nmauris enim accumsan nisi, tincidunt vel. \nEnim ipsum, amet quis ullamcorper eget ut.',
        background,
        false,context);
  }


}

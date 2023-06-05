import 'package:boxy/flex.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';


class FooterBar extends StatefulWidget {
  const FooterBar({Key? key}) : super(key: key);

  @override
  State<FooterBar> createState() => _FooterBarState();
}

class _FooterBarState extends State<FooterBar> {
  @override
  Widget build(BuildContext context) {
    return
      Placeholder(

          child: Scaffold(

            body: new FooterView(
              children:<Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top:200.0),
                  child: Center(
                    child: new Text('Scrollable View'),
                  ),
                ),
              ],
              footer: new Footer(
                backgroundColor: Colors.black,
                child: Text('I am a Customizable footer!!'),
                padding: EdgeInsets.all(10.0),
              ),
              flex: 1, //default flex is 2
            ),
          )
      );


  }
}

import 'package:flutter/material.dart';

import '../../../Constants/constants.dart';

class ModuleCard extends StatefulWidget {
  const ModuleCard({Key? key}) : super(key: key);

  @override
  State<ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<ModuleCard> {


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      width: 300,
      child: Card(

        elevation: 10,
        shadowColor: Colors.yellowAccent,
        child: Column(

          children: [
            Container(
height: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(test),
                  )),

            ),

          ],
        ),
      ),
    );
  }
}



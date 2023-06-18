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

        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(earth),
                  )),

            ),
            Text("we will make ")
          ],
        ),
      ),
    );
  }
}



class CloudShader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud Shader'),
      ),
      body: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [Colors.white, Colors.grey[300]!],
            stops: [0.5, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcATop,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/cloud_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
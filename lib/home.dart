import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:metaballs/metaballs.dart';
import 'package:webapp/Containers/maincontainer.dart';

import 'Containers/container2.dart';
import 'constants.dart';
import 'navbar/navbar.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(

        body: GlassyMetaballs()



        // Metaballs(
        //     color: const Color.fromARGB(255, 66, 133, 244),
        //     effect: MetaballsEffect.follow(
        //       growthFactor: 1,
        //       smoothing: 1,
        //       radius: 0.5,
        //     ),
        //     gradient: LinearGradient(
        //         colors: [
        //           const Color.fromARGB(255, 90, 60, 255),
        //           const Color.fromARGB(255, 120, 255, 255),
        //         ],
        //         begin: Alignment.bottomRight,
        //         end: Alignment.topLeft
        //     ),
        //     metaballs: 40,
        //     animationDuration: const Duration(milliseconds: 200),
        //     speedMultiplier: 1,
        //     bounceStiffness: 3,
        //     minBallRadius: 15,
        //     maxBallRadius: 40,
        //     glowRadius: 0.7,
        //     glowIntensity: 0.6,
        //     child: SingleChildScrollView(
        //       child: Container(
        //         child: Column(
        //           children: [
        //             NavBar(),
        //             SizedBox(
        //               height: 30,
        //             ),
        //             Container1()

        //           ],
        //         ),
        //       ),
        //     ))
        );


  }
}


class GlassyMetaballs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Metaballs(
          color: const Color.fromARGB(255, 66, 133, 244),
          effect: MetaballsEffect.follow(
            growthFactor: 1,
            smoothing: 1,
            radius: 0.5,
          ),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 90, 60, 255),
              const Color.fromARGB(255, 120, 255, 255),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          metaballs: 40,
          animationDuration: const Duration(milliseconds: 200),
          speedMultiplier: 1,
          bounceStiffness: 3,
          minBallRadius: 15,
          maxBallRadius: 40,
          glowRadius: 0.7,
          glowIntensity: 0.6,
        ),
        Container(
          color: Colors.black.withOpacity(0.4), // Semi-transparent white
        ),
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                NavBar(),
                SizedBox(height: 30),
                Container1(),
                Container2()
              ],
            ),
          ),
        ),
      ],
    );
  }
}





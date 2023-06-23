import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';

import '../../../Constants/constants.dart';

class ModuleCard extends StatefulWidget {
  const ModuleCard({Key? key}) : super(key: key);

  @override
  State<ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<ModuleCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // body: Center(
        //   child: MouseRegion(
        //     onEnter: (event) {
        //       setState(() {
        //         isHovered = true;
        //       });
        //     },
        //     onExit: ((event) {
        //       setState(() {
        //         isHovered = false;
        //       });
        //     }),
        //     child: Stack(
        //       clipBehavior: Clip.none,
        //       children: [
        //         AnimatedContainer(
        //           duration: const Duration(milliseconds: 375),
        //           curve: Curves.easeOut,
        //           height: isHovered ? 300.0 : 280.0,
        //           width: 250.0,
        //           decoration: BoxDecoration(
        //             color: Colors.brown[300],
        //             borderRadius: BorderRadius.circular(20.0),
        //           ),
        //         ),
        //         AnimatedPositioned(
        //           duration: const Duration(milliseconds: 375),
        //           curve: Curves.easeOut,
        //           top: isHovered ? -100.0 : 0.0,
        //           child: AnimatedContainer(
        //             duration: const Duration(milliseconds: 375),
        //             curve: Curves.easeOut,
        //             height: isHovered ? 390.0 : 280.0,
        //             width: 250.0,
        //             child: Column(children: [
        //               Padding(
        //                 padding: const EdgeInsets.all(15.0),
        //                 child: AnimatedContainer(
        //                     duration: const Duration(milliseconds: 375),
        //                     curve: Curves.easeOut,
        //                     height: isHovered ? 180.0 : 220.0,
        //                     width: isHovered ? 180.0 : 220.0,
        //                     child: Container(
        //                       child: Center(
        //                           child: ImageNetwork(
        //                         image:
        //                             "https://upload.wikimedia.org/wikipedia/commons/4/47/Hamburger_%28black_bg%29.jpg",
        //                         height: 150,
        //                         width: 280,
        //                         duration: 1500,
        //                         curve: Curves.easeIn,
        //                         onPointer: true,
        //                         debugPrint: false,
        //                         fullScreen: false,
        //                         fitAndroidIos: BoxFit.cover,
        //                         fitWeb: BoxFitWeb.cover,
        //                         borderRadius: BorderRadius.circular(20),
        //                         onLoading: const CircularProgressIndicator(
        //                           color: Colors.indigoAccent,
        //                         ),
        //                         onError: const Icon(
        //                           Icons.error,
        //                           color: Colors.red,
        //                         ),
        //                         onTap: () {
        //                           debugPrint("©image loaded");
        //                         },
        //                       )),
        //                     )),
        //               ),
        //               const Text(
        //                 "Module One",
        //                 style: TextStyle(fontWeight: FontWeight.bold),
        //               ),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               const Expanded(
        //                 child: Padding(
        //                   padding: EdgeInsets.all(8.0),
        //                   child: SingleChildScrollView(
        //                     child: Column(
        //                       children: [
        //                         Text(
        //                           'This is the best module of the world and any body can contribute to this ',
        //                           textAlign: TextAlign.center,
        //                           style: TextStyle(
        //                               fontSize: 15,
        //                               fontWeight: FontWeight.w500,
        //                               color: Colors.white),
        //                         ),
        //                         SizedBox(
        //                           height: 30.0,
        //                         ),
        //                         Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceEvenly,
        //                           children: [
        //                             badges.Badge(
        //                               badgeContent: Text('3'),
        //                               child: Icon(Icons.person_4_sharp),
        //                             ),
        //                             badges.Badge(
        //                               child: Icon(Icons.update),
        //                             ),
        //                           ],
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ]),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}

class PopularCard1 extends StatelessWidget {
  String classImage;
  String title;

  PopularCard1({required this.title,required this.classImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 360,
          height: 152,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFF2C2F48),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x7F000000),
                blurRadius: 20,
                offset: Offset(0, 10),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: -33,
                top: -28,
                child: Container(
                  width: 168,
                  height: 224,
                ),
              ),
              Positioned(
                left: 100,
                top: 0,
                child: Container(
                  width: 260,
                  height: 152,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.83, -0.55),
                      end: Alignment(-0.83, 0.55),
                      colors: [Color(0xFF5B7FD6), Color(0xFF1BB1D0)],
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white.withOpacity(0.4000000059604645),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 48,
                        top: 126,
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('🧑 : 10  ', style: GoogleFonts.aBeeZee()),
                              const SizedBox(width: 4),
                              Text('📄 : 3 Stories', style: GoogleFonts.lato()),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 20,
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 54,
                        child: Text(
                          'A great place to \ndiscuss art.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.550000011920929),
                            fontSize: 13,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 68,
                top: 44,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        classImage,
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: StarBorder.polygon(
                      sides: 6,
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 10,
                        offset: Offset(0, 7),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 68,
                top: 44,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: ShapeDecoration(
                    shape: StarBorder.polygon(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                      sides: 6,
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 10,
                        offset: Offset(0, 7),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

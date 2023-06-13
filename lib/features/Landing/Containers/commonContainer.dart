import 'package:flutter/material.dart';
import 'package:webapp/Widgets/tilt.dart';


import '../../../Constants/constants.dart';


Widget CommonContainer(String s1, s2, s3, image, bool imageLeft,BuildContext context,String tiltMain,String tiltSub) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: w! / 10, vertical: 20),
    color: Colors.transparent,
    // padding: EdgeInsets.symmetric(horizontal: w! / 10, vertical: 30),
    child: Row(
      children: [
        imageLeft
            ? Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TiltWidget(
                          yaxis: (MediaQuery.of(context).size.width / 2) / 2,
                          image: image,
                          text: tiltMain,
                          subText: tiltSub),
                    ],
                  ),
                ),)
            : Container(),
        Expanded(
            child: Column(
          crossAxisAlignment:
              imageLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              s1.toUpperCase(),
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              s2,
              textAlign: imageLeft ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: w! / 20,
                  height: 1.1,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              s3,
              textAlign: imageLeft ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // TextButton.icon(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.arrow_forward_ios,
            //       size: 20,
            //       color: AppColors.buttons,
            //     ),
            //     label: Text(
            //       'Learn more',
            //       style: TextStyle(color: AppColors.buttons),
            //     ))
          ],
        )),
        !imageLeft
            ? Expanded(
                child: Container(
                  color: Colors.transparent,
                  height: 530,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TiltWidget(
                            yaxis: (MediaQuery.of(context).size.width / 2) / 2,
                            image: image,
                            text: tiltMain,
                            subText:tiltSub),
                      ],
                    ),
                  ),

              ))
            : Container()
      ],
    ),
  );
}

Widget CommonContainerMobile(String s1, s2, s3, image, bool imageLeft) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: w! / 10, vertical: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.contain),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          s1.toUpperCase(),
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          s2,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: w! / 10,
              height: 1.1,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          s3,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: AppColors.buttons,
            ),
            label: Text(
              'Learn more',
              style: TextStyle(color: AppColors.buttons),
            )),
      ],
    ),
  );
}

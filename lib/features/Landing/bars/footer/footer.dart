import 'package:flutter/material.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'package:webapp/features/Landing/bars/footer/FooterCopyright.dart';

class FooterBar extends StatefulWidget {
  const FooterBar({Key? key}) : super(key: key);

  @override
  State<FooterBar> createState() => _FooterBarState();
}

class _FooterBarState extends State<FooterBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Placeholder(
          color: Colors.transparent,
          child: Scaffold(
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialWidget(
                          placeholderText: 'VIZOLA',
                          //text visible to viewers
                          iconData: SocialIconsFlutter.facebook_box,
                          //use the respective social logo
                          iconColor: Colors.yellowAccent,
                          //(optional, default - grey)
                          link:
                              'https://in.linkedin.com/in/the-vizola-a221a6243?original_referer=https%3A%2F%2Fwww.google.com%2F',
                          //provide the link
                          placeholderStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20), //placeholder text style
                        ),
                        SizedBox(width: 10),
                        SocialWidget(
                          placeholderText: 'VIZOLA',
                          //text visible to viewers
                          iconData: SocialIconsFlutter.instagram,
                          //use the respective social logo
                          iconColor: Colors.yellowAccent,
                          //(optional, default - grey)
                          link:
                              'https://in.linkedin.com/in/the-vizola-a221a6243?original_referer=https%3A%2F%2Fwww.google.com%2F',
                          //provide the link
                          placeholderStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20), //placeholder text style
                        ),
                        SizedBox(width: 10),
                        SocialWidget(
                          placeholderText: 'VIZOLA',
                          //text visible to viewers
                          iconData: SocialIconsFlutter.linkedin_box,
                          //use the respective social logo
                          iconColor: Colors.yellowAccent,
                          //(optional, default - grey)
                          link:
                              'https://in.linkedin.com/in/the-vizola-a221a6243?original_referer=https%3A%2F%2Fwww.google.com%2F',
                          //provide the link
                          placeholderStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20), //placeholder text style
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(10.0),
                    child: FooterCopyright(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

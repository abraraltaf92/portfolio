// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:abraraltaf/util/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SocialHandles extends StatefulWidget {
  @override
  _SocialHandlesState createState() => _SocialHandlesState();
}

class _SocialHandlesState extends State<SocialHandles> {
  Container socialButton(BuildContext context, IconData icon, String link) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).textTheme.bodyText1.color,
          width: 2.0,
        ),
      ),
      margin: EdgeInsets.only(right: Config.xMargin(context, 4)),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(CircleBorder()),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: MaterialStateProperty.all(
              EdgeInsets.all(Config.xMargin(context, 3))),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor:
              MaterialStateProperty.all(Theme.of(context).accentColor),
          elevation: MaterialStateProperty.all(4),
          animationDuration: Duration(milliseconds: 2000),
        ),
        child: Icon(
          icon,
          size: Config.xMargin(context, 5),
        ),
        onPressed: () {
          html.window.open(link, '');
        },
      ),
    );
  }

  final List<Map<String, dynamic>> _socials = [
    {
      'icon': MaterialCommunityIcons.email,
      'link': 'mailto:abrar_12btech18@nitsri.net'
    },
    {
      'icon': MaterialCommunityIcons.twitter,
      'link': 'https://twitter.com/abraraltaf92'
    },
    {
      'icon': MaterialCommunityIcons.github_circle,
      'link': 'https://github.com/abraraltaf92'
    },
    {
      'icon': MaterialCommunityIcons.linkedin,
      'link': 'https://www.linkedin.com/in/abraraltaf92/'
    },
    {
      'icon': MaterialCommunityIcons.instagram,
      'link': 'https://www.instagram.com/abraraltaf92/'
    },
    {
      'icon': MaterialCommunityIcons.whatsapp,
      'link': 'https://wa.me/+917889881902'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.yMargin(context, 8),
      margin: EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.centerLeft,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _socials
              .map((social) =>
                  socialButton(context, social['icon'], social['link']))
              .toList(),
        ),
      ),
    );
  }
}

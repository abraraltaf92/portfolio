// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:abraraltaf/lists/skills_list.dart';
import 'package:abraraltaf/util/config.dart';
import 'package:abraraltaf/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final column = Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 8.0, bottom: Config.yMargin(context, 2)),
              child: Text(
                'About Me',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Config.xMargin(context, 6),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                'Energetic and passionate B.Tech underGrad(ECE) student aiming to use every inch of my knowledge at its best of behest. I have used a lot of online resources and hands on project to be where I am today. Shoutout to some of them : Youtube Tutorials , Udemy Courses , Medium Articles , StackOverflow , Github etc. I have sound knowledge of FLUTTER, DART, FIREBASE, GIT, GITHUB, PYTHON AND A GOOD HOLD OVER C++, C, JAVASCRIPT, ML, DEEP LEARNING CONCEPTS and more.',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Config.xMargin(context, 2.5),
                ),
              ),
            ),
            SizedBox(height: Config.yMargin(context, 1)),
            Container(
              height: Config.xMargin(context, 7),
              child: FittedBox(
                child: RoundedButton(
                  text: 'View Resume',
                  callBack: () {
                    final url =
                        'https://drive.google.com/file/d/1Vmep5fLFMqDBxahcTY0Ey-pdRfhO1zN8/view?usp=sharing';
                    html.window.open(url, '');
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: Config.yMargin(context, 2),
              ),
              child: Text(
                'What can I do for you?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Config.xMargin(context, 5),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              height: Config.yMargin(context, 28),
              width: double.infinity,
              child: ListView.builder(
                itemCount: skillList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => Container(
                  width: Config.xMargin(context, 50),
                  margin: const EdgeInsets.all(15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFF121212),
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          skillList[i].icon,
                          size: Config.xMargin(context, 8),
                          color: Theme.of(context).accentColor,
                        ),
                        Text(
                          skillList[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Config.xMargin(context, 4),
                          ),
                        ),
                        Text(
                          skillList[i].description,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: Config.xMargin(context, 2.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

    // temporary
    return Container(
      padding: EdgeInsets.only(
        top: Config.yMargin(context, 5),
        right: mediaQuery.width > 550 ? Config.xMargin(context, 15) : 20,
        left: mediaQuery.width > 550
            ? Config.xMargin(context, 10)
            : Config.xMargin(context, 7),
      ),
      child: column,
    );
  }
}

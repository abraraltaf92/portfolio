// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:abraraltaf/util/config.dart';
import 'package:abraraltaf/widgets/rounded_button.dart';
import 'package:abraraltaf/widgets/social_handles.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Function swipe;
  Home(this.swipe);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Animation<double> _fadeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1700),
      vsync: this,
    )..forward();
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -10.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    Container image = Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('images/abrar.png'),
          fit: BoxFit.contain,
        ),
      ),
    );

    Container column = Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: mediaQuery.width < 550
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _offsetAnimation,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  'HI THERE, I\'M',
                  style: TextStyle(
                    fontSize: Config.xMargin(context, 3),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                crossAxisAlignment: mediaQuery.width < 550
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  TypewriterAnimatedTextKit(
                    text: ['Abrar', 'Altaf'],
                    totalRepeatCount: 1,
                    speed: Duration(milliseconds: 350),
                    textStyle: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: Config.xMargin(context, 10),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      'A FLUTTER DEVELOPER',
                      style: TextStyle(
                        fontSize: Config.xMargin(context, 3),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      'I am a flutter developer who loves to build responsive and scaleable apps for Android, IOS and Web. I am currently in a race to grab as much I can from the innovative world to create more innovations. I believe in unlearning errors. And I love to code ; \nTo me it\'s like if they talk about WEB DEV, APP DEV i\'ll reflect with FLUTTER.',
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textAlign: mediaQuery.width < 550
                          ? TextAlign.center
                          : TextAlign.start,
                      style: TextStyle(
                        fontSize: Config.xMargin(context, 2.5),
                      ),
                    ),
                  ),
                  SizedBox(height: Config.yMargin(context, 1)),
                  SocialHandles(),
                  SizedBox(height: Config.yMargin(context, 1)),
                  Container(
                    height: Config.xMargin(context, 7),
                    padding: const EdgeInsets.only(left: 4.0),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundedButton(
                            text: 'Hire Me',
                            callBack: () {
                              html.window.open(
                                  'mailto:abrar_12btech18@nitsri.net', '#');
                            },
                          ),
                          SizedBox(width: Config.xMargin(context, 1)),
                          RoundedButton(
                            text: 'Projects',
                            callBack: () => widget.swipe(2),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    // temporary
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: Config.xMargin(context, 10),
          right: Config.xMargin(context, 10),
          top: Config.yMargin(context, 8),
        ),
        child: mediaQuery.width > 550
            ? Row(
                children: [
                  Expanded(flex: 2, child: column),
                  SizedBox(width: Config.xMargin(context, 3)),
                  Expanded(flex: 1, child: image)
                ],
              )
            : Column(
                children: [
                  Expanded(flex: 1, child: image),
                  SizedBox(height: Config.yMargin(context, 2)),
                  Expanded(flex: 2, child: column)
                ],
              ),
      ),
    );
  }
}

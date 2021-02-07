import 'package:first_proj/util/config.dart';
import 'package:first_proj/pages/about_me.dart';
import 'package:first_proj/pages/home.dart';
import 'package:first_proj/pages/projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/rendering.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void swipe(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
  }

  Widget navButton(BuildContext context, String text, int index) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RaisedButton(
        padding: EdgeInsets.all(20),
        color: Colors.transparent,
        hoverColor: Theme.of(context).accentColor,
        elevation: 0,
        hoverElevation: 0,
        child: Text(text),
        onPressed: () {
          swipe(index);
          if (width < 550) Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final buttons = [
      'Home',
      'About me',
      'Projects',
    ];
    List<Widget> _navItems() {
      return [
        ...List.generate(
          3,
          (index) => navButton(context, buttons[index], index),
        )
      ];
    }

    List<Widget> _pages = [
      Home(swipe),
      AboutMe(),
      Projects(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: width < 550
            ? null
            : Padding(
                padding: EdgeInsets.only(left: Config.xMargin(context, 8)),
                child: Row(
                  children: <Widget>[
                    Text(
                      'a',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: Config.xMargin(context, 6)),
                    ),
                    Text(
                      'A',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).accentColor,
                          fontSize: Config.xMargin(context, 6)),
                    ),
                  ],
                ),
              ),
        actions: width > 550 ? _navItems() : [],
        leading: width < 550
            ? IconButton(
                icon: Icon(FontAwesome.ellipsis_v),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                })
            : null,
      ),
      drawer: width < 550
          ? Drawer(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _navItems(),
                ),
              ),
            )
          : null,
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              pageSnapping: false,
              scrollDirection: Axis.vertical,
              children: _pages,
              onPageChanged: (int index) {
                setState(() {
                  _pageIndex = index;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedSmoothIndicator(
                  count: 3,
                  activeIndex: _pageIndex,
                  axisDirection: Axis.vertical,
                  effect: WormEffect(
                      dotWidth: 25,
                      dotHeight: 10,
                      spacing: 16,
                      activeDotColor: Theme.of(context).accentColor),
                  onDotClicked: (newIndex) => swipe(newIndex),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: _pageIndex == 2,
        child: FloatingActionButton(
          onPressed: () => swipe(0),
          child: Icon(
            FontAwesome.arrow_up,
          ),
        ),
        replacement: SizedBox.shrink(),
      ),
    );
  }
}

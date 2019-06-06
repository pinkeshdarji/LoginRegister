import 'package:flutter/material.dart';
import 'package:login_register/utlities/app_colors.dart';

import 'intro_widget.dart';

class OnBoardingCircle extends StatefulWidget {
  @override
  _OnBoardingCircleState createState() => _OnBoardingCircleState();
}

class _OnBoardingCircleState extends State<OnBoardingCircle> {
  double screenWidth = 0.0;
  double screenheight = 0.0;

  int currentPageValue = 0;
  int previousPageValue = 0;
  PageController controller;
  double _moveBar = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = PageController(initialPage: currentPageValue);
  }

  void getChangedPageAndMoveBar(int page) {
    print('page is $page');

    currentPageValue = page;

    if (previousPageValue == 0) {
      previousPageValue = currentPageValue;
      _moveBar = _moveBar + 0.14;
    } else {
      if (previousPageValue < currentPageValue) {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar + 0.14;
      } else {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar - 0.14;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;

    final List<Widget> introWidgetsList = <Widget>[
      IntroWidget(
          screenWidth: screenWidth,
          screenheight: screenheight,
          image: 'assets/images/purple.png',
          type: 'Music',
          startGradientColor: kBlue,
          endGradientColor: kPruple,
          subText: 'EXPERIENCE WICKED PLAYLISTS'),
      IntroWidget(
          screenWidth: screenWidth,
          screenheight: screenheight,
          image: 'assets/images/yellow.png',
          type: 'Spa',
          startGradientColor: kOrange,
          endGradientColor: kYellow,
          subText: 'FEEL THE MAGIC OF WELLNESS'),
      IntroWidget(
          screenWidth: screenWidth,
          screenheight: screenheight,
          image: 'assets/images/green.png',
          type: 'Travel',
          startGradientColor: kGreen,
          endGradientColor: kBlue2,
          subText: "LET'S HIKE IT UP!"),
      IntroWidget(
          screenWidth: screenWidth,
          screenheight: screenheight,
          image: 'assets/images/red.png',
          type: 'Books',
          startGradientColor: kLightOrange,
          endGradientColor: kLightRed,
          subText: 'HAVE A BREAK, HAVE A E-BOOK'),
    ];

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: introWidgetsList.length,
              onPageChanged: (int page) {
                getChangedPageAndMoveBar(page);
              },
              controller: controller,
              itemBuilder: (context, index) {
                return introWidgetsList[index];
              },
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 35),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < introWidgetsList.length; i++)
                        if (i == currentPageValue) ...[expandingBar(true)] else
                          expandingBar(false),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? kOrange : klightGrey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  Widget expandingBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: isActive ? 25 : 8,
      decoration: BoxDecoration(
          color: isActive ? kOrange : kLightRed,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

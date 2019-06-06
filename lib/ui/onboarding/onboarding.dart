import 'package:flutter/material.dart';
import 'package:login_register/utlities/app_colors.dart';

import 'intro_widget.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
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

    if (previousPageValue == 0) {
      previousPageValue = page;
      _moveBar = _moveBar + 0.14;
    } else {
      if (previousPageValue < page) {
        previousPageValue = page;
        _moveBar = _moveBar + 0.14;
      } else {
        previousPageValue = page;
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
                      for (var i in introWidgetsList) slidingBar(),
                    ],
                  ),
                ),
                AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.fastOutSlowIn,
                    margin: EdgeInsets.only(
                        bottom: 35, left: screenWidth * _moveBar),
                    //left: screenWidth * _moveBar,
                    child: movingBar()),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Container movingBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 5,
      width: screenWidth * 0.1,
      decoration: BoxDecoration(color: kwhiteGrey),
    );
  }

  Widget slidingBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 5,
      width: screenWidth * 0.1,
      decoration: BoxDecoration(color: klightGrey),
    );
  }
}

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

  PageController controller = PageController();
  var currentPageValue = 0.0;
  double _moveBar = 0.05;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getChangedPageAndMoveBar(int page) {
    print('page is $page');
    switch (page) {
      case 0:
        _moveBar = 0.05;
        break;
      case 1:
        _moveBar = 0.18;
        break;
      case 2:
        _moveBar = 0.31;
        break;
      case 3:
        _moveBar = 0.44;
        break;
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
          children: <Widget>[
            PageView(
              onPageChanged: (int page) {
                getChangedPageAndMoveBar(page);
              },
              controller: controller,
              children: introWidgetsList,
            ),
            Positioned(
              bottom: screenheight * 0.1,
              left: screenWidth * 0.04,
              child: Row(
                children: <Widget>[
                  slidingBar(),
                  slidingBar(),
                  slidingBar(),
                  slidingBar(),
                ],
              ),
            ),
            AnimatedPositioned(
                duration: Duration(milliseconds: 100),
                bottom: screenheight * 0.1,
                left: screenWidth * _moveBar,
                child: movingBar())
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

  Container slidingBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 5,
      width: screenWidth * 0.1,
      decoration: BoxDecoration(color: klightGrey),
    );
  }
}

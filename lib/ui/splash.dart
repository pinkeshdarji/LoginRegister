import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_register/utlities/app_colors.dart';
import 'package:login_register/utlities/hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/home.dart';
import 'login/login.dart';
import 'onboarding/onboarding_circle.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final _startBgColor = HexColor('485563');
  final _endBgColor = HexColor('29323c');
  double screenWidth = 0.0;
  double screenheight = 0.0;

  SharedPreferences prefs;
  final String onBoardingStatus = 'onBoardingStatus';
  final String kUser = 'user';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadSettings();
  }

  void _loadSettings() async {
    prefs = await SharedPreferences.getInstance();

    //Timer(Duration(seconds: 2), () => print('hi'));
    Future.delayed(Duration(seconds: 2), () {
      if (prefs.getBool(onBoardingStatus ?? false) == true) {
        if (prefs.getString(kUser ?? '') == '') {
          //User is not logged in
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        } else {
          //User is logged in
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnBoardingCircle()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                      colors: [_startBgColor, kPrimaryColor])),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/purple.png'))),
              width: screenWidth * 0.5,
              height: screenheight * 0.5,
            ),
            Positioned(
                right: screenWidth * 0.2, child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}

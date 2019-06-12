import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_register/ui/login/login.dart';
import 'package:login_register/utlities/hex_color.dart';

void main() => runApp(LoginRegister());

class LoginRegister extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final _endBgColor = HexColor('29323c');
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: _endBgColor,
        statusBarIconBrightness: Brightness.light));

    return MaterialApp(
      title: 'Login register',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Login(),
    );
  }
}

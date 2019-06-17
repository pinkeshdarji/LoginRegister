import 'package:flutter/material.dart';
import 'package:login_register/ui/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences prefs;
  final String kUser = 'user';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(child: Text('Welcome')),
            RaisedButton(
              onPressed: () {
                _logout();
              },
              child: Text('Logout'),
            )
          ],
        ),
      )),
    );
  }

  void _logout() {
    prefs.setString(kUser, '');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}

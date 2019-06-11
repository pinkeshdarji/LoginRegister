import 'package:flutter/material.dart';
import 'package:login_register/utlities/app_colors.dart';
import 'package:login_register/utlities/gradient_raised_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double screenWidth = 0.0;
  double screenheight = 0.0;
  bool isSwitched = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  FocusNode emailNode = FocusNode();
  FocusNode passawordNode = FocusNode();
  bool loading = false;
  String _email;
  String _password;

  @override
  void initState() {
    super.initState();
    passawordNode = FocusNode();
    emailNode = FocusNode();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [kLighOrange2, kPurple])),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: <Widget>[
                    hiveImage(),
                    _existingLoginSwitch(),
                    _signinSignupForm(),
                    _forgotPassword(),
                    _orDivider(),
                    _socialLogin(),
                  ],
                ),
              ),
            ),
          ),
          loading ? LoadingIndicator() : Container()
        ],
      ),
    );
  }

  Widget hiveImage() {
    return Image.asset(
      'assets/images/hive.png',
      width: 300,
      height: 300,
    );
  }

  Widget _existingLoginSwitch() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Container(
            width: screenWidth * 0.7,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.15),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              tabs: [
                Tab(
                  child: Text(
                    'Existing',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Tab(text: 'New'),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 170,
            child: TabBarView(
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      child: Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            emailFormField(),
                            SizedBox(
                              height: 10,
                            ),
                            passwordFormField(),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 5,
                        left: screenWidth * 0.15,
                        child: LoginButton(context)),
                  ],
                ),
                Icon(Icons.directions_transit),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _signinSignupForm() {
    return Container(
      child: Checkbox(value: true, onChanged: null),
    );
  }

  Container _forgotPassword() {
    return Container(
      child: FlutterLogo(),
    );
  }

  Container _orDivider() {
    return Container(
      child: FlutterLogo(),
    );
  }

  Container _socialLogin() {
    return Container(
      child: FlutterLogo(),
    );
  }

  TextStyle CustomTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 15.0);
  }

  InputDecoration CustomTextDecoration(
      {String text, IconData icon, bool trailingicon = false}) {
    return InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        //alignLabelWithHint: true,
        //labelStyle: TextStyle(color: Colors.white30),
        //labelText: text,
        prefixIcon: Icon(icon, color: Colors.blueGrey[700]),
        suffixIcon: trailingicon
            ? IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye),
                color: Colors.grey,
              )
            : null
//      enabledBorder: UnderlineInputBorder(
//          borderSide: BorderSide(color: Colors.blueGrey[700])),
//      focusedBorder:
//          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
//      errorBorder:
//          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
        );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      enabled: true,
      enableInteractiveSelection: true,
      obscureText: true,
      textInputAction: TextInputAction.done,
      style: CustomTextStyle(),
      focusNode: passawordNode,
      decoration: CustomTextDecoration(
          icon: Icons.lock, text: "Password", trailingicon: true),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter password';
        } else if (value.length < 6) {
          return 'Password must be 6 digit';
        }
      },
      onSaved: (val) => _password = val,
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      enabled: true,
      enableInteractiveSelection: true,
      focusNode: emailNode,
      style: CustomTextStyle(),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration:
          CustomTextDecoration(icon: Icons.email, text: "Email Address"),
      textCapitalization: TextCapitalization.none,
      onFieldSubmitted: (term) {
        emailNode.unfocus();
        FocusScope.of(context).requestFocus(passawordNode);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter email';
        } else if (!new RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return "Plase enter valid email";
        }
      },
      onSaved: (val) => _email = val,
    );
  }

  Widget LoginButton(BuildContext context) {
    return RaisedGradientButton(
        child: Text(
          'Login'.toUpperCase(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        height: 80,
        width: screenWidth * 0.6,
        gradient: LinearGradient(
          colors: <Color>[kPruple, kLighOrange2],
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          final form = _formKey.currentState;

          if (form.validate()) {
            form.save();
            print('email is $_email and password is $_password');
            setState(() {
              loading = true;
            });
            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                loading = false;
              });
            });
          } else {
            setState(() {
              _autoValidate = true;
            });
          }
        });
  }

  Widget LoadingIndicator() {
    return Positioned(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: CircularProgressIndicator(strokeWidth: 0.7),
          ),
        ),
      ),
    );
  }
}

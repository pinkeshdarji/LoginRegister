import 'package:flutter/material.dart';
import 'package:login_register/ui/custom_paint/slate.dart';

class WhiteSlate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.redAccent,
        body: Center(
          child: Transform.rotate(
            angle: 180,
            child: CustomPaint(
              foregroundPainter: SlatePainter(),
              child: Container(
                width: 300,
                height: 150,
              ),
            ),
          ),
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_register/ui/custom_paint/page.dart';

class NotebookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: CustomPaint(
            foregroundPainter: PagePainter(),
            child: Container(
              width: 300,
              height: 150,
            ),
          ),
        ),
      )),
    );
  }
}

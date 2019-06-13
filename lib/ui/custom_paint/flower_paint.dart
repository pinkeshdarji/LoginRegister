import 'package:flutter/material.dart';

class FlowerPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path2 = Path();
    final paint2 = Paint();

    path2.moveTo(size.width * 0.12, size.height * 0.1);

    path2.quadraticBezierTo(
        10, size.height * 0.15, size.width * 0.1, size.height * 0.18);

    path2.quadraticBezierTo(size.width * 0.3, size.height * 0.25,
        size.width * 0.3, size.height * 0.15);

    path2.quadraticBezierTo(size.width * 0.29, size.height * 0.06,
        size.width * 0.3, size.height * 0.1);

    path2.quadraticBezierTo(size.width * 0.27, size.height * 0.05,
        size.width * 0.12, size.height * 0.1);

    paint2.color = Colors.deepPurple;
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}

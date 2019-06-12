import 'package:flutter/material.dart';

class ResizeStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('hi'),
                Text('hi'),
                Text('hi'),
              ],
            ),
            Positioned(
              bottom: -15,
              left: MediaQuery.of(context).size.width / 2,
              child: Text('hi'),
            ),
          ],
        ),
      ),
    );
  }
}

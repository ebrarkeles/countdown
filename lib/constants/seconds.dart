import 'package:countdown_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

class MySeconds extends StatelessWidget {
  int secs;

  MySeconds({super.key, required this.secs});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        secs < 10 ? "0" + secs.toString() : secs.toString(),
        style: TextStyle(
            fontSize: Constants.calculateFontSize(23),
            fontWeight: FontWeight.bold),
      )),
    );
  }
}

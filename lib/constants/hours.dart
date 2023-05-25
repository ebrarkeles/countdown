// ignore_for_file: must_be_immutable

import 'package:countdown_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

class MyHours extends StatelessWidget {
  int hours;

  MyHours({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      hours < 10 ? "0$hours" : hours.toString(),
      style: TextStyle(
          fontSize: Constants.calculateFontSize(23),
          fontWeight: FontWeight.bold),
    ));
  }
}

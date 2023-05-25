// ignore_for_file: must_be_immutable

import 'package:countdown_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

class MyMinutes extends StatelessWidget {
  int mins;

  MyMinutes({super.key, required this.mins});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      mins < 10 ? "0$mins" : mins.toString(),
      style: TextStyle(
          fontSize: Constants.calculateFontSize(23),
          fontWeight: FontWeight.bold),
    ));
  }
}

import 'package:countdown_flutter/model/data_helper.dart';
import 'package:flutter/material.dart';

class Sayac {
  DateTime sayacDteTime;
  String? description;
  bool? isActive;
  List<Color>? gradientColors = GradientColors.sky;

  Sayac(this.sayacDteTime, {this.description, this.gradientColors});
}

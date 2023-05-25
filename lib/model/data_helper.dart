import 'package:countdown_flutter/model/sayac.dart';
import 'package:countdown_flutter/model/sayac_info.dart';
import 'package:countdown_flutter/pages/alarm_page.dart';
import 'package:countdown_flutter/pages/new_alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/constants.dart';
import '../constants/ui_helper.dart';
import '../pages/new_countdown.dart';
import '../widgets/home_center.dart';
import 'alarm_info.dart';
import 'dart:math' as matematik;

landscapeFloat(context) {
  return Container(
    width: 70.h,
    height: 70.h,
    child: Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 70.h,
        height: 70.h,
        decoration: BoxDecoration(
          color: Constants.anaRenk2,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: IconButton(
            tooltip: "Add Countdown",
            onPressed: () {
              newCountdownBottomSheet(context);
            },
            icon: const Icon(
              Icons.more_time_sharp,
              color: Color(0xFFEAECFF),
              size: 35,
            ),
          ),
        ),
      ),
    ),
  );
}

portoraitFloat(context) {
  return Container(
    width: 70.h,
    height: 70.h,
    child: Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 70.h,
        height: 70.h,
        decoration: BoxDecoration(
          color: Constants.anaRenk2,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: IconButton(
            tooltip: "Add Countdown",
            onPressed: () {
              newCountdownBottomSheet(context);
            },
            icon: const Icon(Icons.more_time_sharp,
                color: Color(0xFFEAECFF), size: 35),
          ),
        ),
      ),
    ),
  );
}

newCountdownBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.4,
        maxChildSize: 0.9,
        minChildSize: 0.32,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: const NewCountForm(),
        ),
      );
    },
  );
}

landscapeHomeCenter(context) {
  return Stack(
    children: [
      Expanded(
        child: Center(
          child: Container(child: Expanded(child: HomeCenter())),
        ),
      ),
      Positioned(
          left: 375.w,
          top: 300.h,
          child: UIHelper.getFloatActionButton(context)),
      Positioned(
          top: 220.h,
          left: 375.w,
          child: UIHelper.getAlarmFloatActionButton(context)),
    ],
  );
}

portraitHomeCenter(context) {
  return Stack(
    children: [
      Expanded(
        child: Center(
          child: Container(
            child: Expanded(
              child: HomeCenter(),
            ),
          ),
        ),
      ),
      Positioned(
        left: 310.w,
        top: 680.h,
        child: UIHelper.getFloatActionButton(context),
      ),
      Positioned(
        left: 310.w,
        top: 600.h,
        child: UIHelper.getAlarmFloatActionButton(context),
      ),
    ],
  );
}

portraitAlarmFloat(context) {
  return Container(
    width: 70.h,
    height: 70.h,
    child: Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 70.h,
        height: 70.h,
        decoration: BoxDecoration(
          color: Constants.anaRenk2,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: IconButton(
            tooltip: "Add Alarm",
            onPressed: () {
              newAlarmBottomSheet(context);
            },
            icon: const Icon(
              Icons.alarm_add_outlined,
              color: Color(0xFFEAECFF),
              size: 35,
            ),
          ),
        ),
      ),
    ),
  );
}

newAlarmBottomSheet(context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.4,
        maxChildSize: 0.9,
        minChildSize: 0.32,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: const NewAlarmForm(),
        ),
      );
    },
  );
}

landscapeAlarmFloat(context) {
  return Container(
    width: 70.h,
    height: 70.h,
    child: Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 70.h,
        height: 70.h,
        decoration: BoxDecoration(
          color: Constants.anaRenk2,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: IconButton(
            tooltip: "Add Alarm",
            onPressed: () {
              newAlarmBottomSheet(context);
            },
            icon: const Icon(
              Icons.alarm_add_outlined,
              color: Color(0xFFEAECFF),
              size: 35,
            ),
          ),
        ),
      ),
    ),
  );
}

Color rastgeleRenkUret() {
  return Color.fromARGB(
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255));
}

class GradientColors {
  static List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
}

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),
      description: "Office", gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)), description: "Sport"),
];

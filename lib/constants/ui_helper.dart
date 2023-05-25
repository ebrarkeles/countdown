import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/data_helper.dart';
import '../widgets/home_center.dart';

class UIHelper {
  UIHelper._();

  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.10.sh : 0.08.sw;
  }

  static Container getFloatActionButton(context) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return portoraitFloat(context);
    } else {
      return landscapeFloat(context);
    }
  }

  static Container getAlarmFloatActionButton(context) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return portraitAlarmFloat(context);
    } else {
      return landscapeAlarmFloat(context);
    }
  }

  static Stack getHomeCenter(context) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return portraitHomeCenter(context);
    } else {
      return landscapeHomeCenter(context);
    }
  }

  static EdgeInsets getAppTitlePadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(17.h);
    } else {
      return EdgeInsets.all(8.w);
    }
  }

  static EdgeInsets getFormPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(25.h);
    } else {
      return EdgeInsets.all(13.w);
    }
  }

  static double getNewSayacFormWAppbarHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.07.sh : 0.07.sw;
  }

  static EdgeInsets getNewSayacFormApppbarIconPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.only(top: 10.h, left: 17.h, right: 17.h, bottom: 10.h);
    } else {
      return EdgeInsets.only(top: 10.h, left: 22.h, right: 22.h, bottom: 10.h);
    }
  }
}

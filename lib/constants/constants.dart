// ignore_for_file: non_constant_identifier_names

import 'package:countdown_flutter/model/sayac.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static String title = "CLOCK";

  static Color anaRenk = const Color(0xFF2D2F41);
  static Color anaRenk2 = const Color.fromARGB(255, 77, 82, 131);
  static Color ucuncuRenk = const Color(0xFF2D2F41);
  static Color anaRenkTurevi = const Color.fromARGB(255, 75, 74, 74);
  static Color ikinciRenk = const Color(0xFF1C2757);
  static Color ikinciRenkTurvi = const Color(0xFF323F68);
  static Color anaRenkIcon = const Color(0xFF444974);
  static Color takvimContainerRenk = const Color.fromARGB(255, 205, 208, 243);

  static TextStyle getTitleTextStyle() {
    return TextStyle(
      color: const Color(0xFFEAECFF),
      fontWeight: FontWeight.bold,
      fontSize: calculateFontSize(32),
      fontFamily: "familybir",
    );
  }

  static String isEmptyCenterText = "Lütfen Sayaç Ekleyiniz !";
  static TextStyle getIsEmptyCenterTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.grey,
      fontSize: calculateFontSize(20),
      fontFamily: "familybir",
    );
  }

  static calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 1.20).sp;
    }
  }

  static List<Sayac> tumEklenenSayaclar = [];

  static sayacEkle(Sayac sayac) {
    tumEklenenSayaclar.add(sayac);
  }

  static RoundedRectangleBorder formAppbarShape() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(22),
              bottomLeft: Radius.circular(22)));
    } else {
      return const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(35),
              bottomLeft: Radius.circular(35)));
    }
  }

  static double getNewSayacIconSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 32.w;
    } else {
      return 18.w;
    }
  }

  static TextStyle getNewSayacSaveButtonTextStyle() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return TextStyle(
        fontSize: calculateFontSize(25),
        fontWeight: FontWeight.w600,
        fontFamily: "familybir",
        color: const Color(0xFFEAECFF),
      );
    } else {
      return TextStyle(
        fontSize: calculateFontSize(25),
        fontFamily: "familybir",
        color: const Color(0xFFEAECFF),
      );
    }
  }

  static BorderRadius alarmCardBorderShape() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return const BorderRadius.all(Radius.circular(24));
    } else {
      return const BorderRadius.all(Radius.circular(28));
    }
  }

  static Text NexSayacAppBarTitle = const Text("Zamanlayıcı Ekle");

  static saniyeyeCevir() {}
}

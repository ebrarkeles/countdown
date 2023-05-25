import 'dart:math';

import 'package:countdown_flutter/constants/constants.dart';
import 'package:countdown_flutter/main.dart';
import 'package:countdown_flutter/model/data_helper.dart';
import 'package:countdown_flutter/pages/gerisay%C4%B1m_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool switchState = true;

  @override
  Widget build(BuildContext context) {
    //formda scroll ile girilen değeri bununla çağırabiliriz
    late List<int> gelenZamanAlarm =
        ModalRoute.of(context)!.settings.arguments as List<int>;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ));
                    },
                    icon: Icon(Icons.arrow_back_rounded),
                  ),
                  SizedBox(width: 110.w),
                  Text(
                    "Alarm ",
                    style: TextStyle(
                        fontFamily: "familybir",
                        fontWeight: FontWeight.w700,
                        color: Constants.anaRenkIcon,
                        fontSize: 24),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: alarms.map<Widget>(
                    (alarm) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 32.h),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        //height: 90.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: alarm.gradientColors ?? GradientColors.sea,
                            begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: alarm.gradientColors?.last
                                        .withOpacity(0.4) ??
                                    GradientColors.sea.last.withOpacity(0.4),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: Offset(4, 4))
                          ],
                          borderRadius: Constants.alarmCardBorderShape(),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.label,
                                      color: Colors.white,
                                      size: Constants.calculateFontSize(24),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      "Office",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "familybir"),
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: switchState,
                                  onChanged: (secilen) {
                                    setState(() {
                                      switchState = secilen;
                                    });
                                  },
                                  activeColor: Colors.white,
                                )
                              ],
                            ),
                            Text(
                              "Mon-Fri",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "familybir"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "07:00 AM",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "familybir",
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          Constants.calculateFontSize(24)),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 36.w,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ).followedBy(
                      //bu listeye ne eklersen ekle listenin sonuna yerleşecek bir şey oluştur demek
                      [
                        DottedBorder(
                          // çizgi çizdi vs çerçeve çeşitleri sağlıyor
                          //ilk wrap yaptığımda hata verdi çünkü listview ı Widget lar içerior diye gimemiz gerekiyor çeşitliliğin de olduğunu göstermek için
                          strokeWidth: 3,
                          color: Constants.anaRenkIcon,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(24),
                          dashPattern: [5, 4],
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Constants.anaRenk2,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            ),
                            child: MaterialButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                onPressed: () {
                                  newAlarmBottomSheet(context);
                                },
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/add_alarm.png",
                                        scale: 1.5),
                                    SizedBox(height: 8.w),
                                    Text(
                                      "Add Alarm",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "familybir",
                                          fontSize:
                                              Constants.calculateFontSize(24),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )),
                          ),
                        )
                      ]).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  kalanGunHesaplama() {}
}

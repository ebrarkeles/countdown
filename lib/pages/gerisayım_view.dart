import 'package:countdown_flutter/constants/constants.dart';
import 'package:countdown_flutter/model/data_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeriSayimView extends StatefulWidget {
  const GeriSayimView({super.key});

  @override
  State<GeriSayimView> createState() => _GeriSayimViewState();
}

class _GeriSayimViewState extends State<GeriSayimView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: GradientColors.sky,
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.keyboard_backspace_outlined,
                          color: Constants.anaRenkIcon.withOpacity(0.8),
                          size: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, bottom: 16, right: 16, top: 16),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_rounded,
                        color: Constants.anaRenkIcon.withOpacity(0.8),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 160.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //yıl
                    children: [
                      Column(
                        children: [
                          DottedBorder(
                            strokeWidth: 3,
                            color: Constants.anaRenkIcon.withOpacity(0.4),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            dashPattern: [5, 4],
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Constants.takvimContainerRenk,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "01",
                                style: TextStyle(
                                    fontSize: Constants.calculateFontSize(45)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "YIL",
                            style: TextStyle(
                              fontFamily: "familybir",
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.calculateFontSize(24),
                            ),
                          ),
                        ],
                      ),

                      // ay
                      Column(
                        children: [
                          DottedBorder(
                            strokeWidth: 3,
                            color: Constants.anaRenkIcon.withOpacity(0.4),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            dashPattern: [5, 4],
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Constants.takvimContainerRenk,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "01",
                                style: TextStyle(
                                    fontSize: Constants.calculateFontSize(45)),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "AY",
                            style: TextStyle(
                              fontFamily: "familybir",
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.calculateFontSize(24),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          DottedBorder(
                            strokeWidth: 3,
                            color: Constants.anaRenkIcon.withOpacity(0.4),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            dashPattern: [5, 4],
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Constants.takvimContainerRenk,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "01",
                                style: TextStyle(
                                    fontSize: Constants.calculateFontSize(45)),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "GÜN",
                            style: TextStyle(
                              fontFamily: "familybir",
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.calculateFontSize(24),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 100.h),

                  ////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // saat
                      Column(
                        children: [
                          DottedBorder(
                            strokeWidth: 3,
                            color: Constants.anaRenkIcon.withOpacity(0.4),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            dashPattern: [5, 4],
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Constants.takvimContainerRenk,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "01",
                                style: TextStyle(
                                    fontSize: Constants.calculateFontSize(45)),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "SAAT",
                            style: TextStyle(
                              fontFamily: "familybir",
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.calculateFontSize(24),
                            ),
                          ),
                        ],
                      ),
                      // dakika
                      Column(
                        children: [
                          DottedBorder(
                            strokeWidth: 3,
                            color: Constants.anaRenkIcon.withOpacity(0.4),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            dashPattern: [5, 4],
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Constants.takvimContainerRenk,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "01",
                                style: TextStyle(
                                    fontSize: Constants.calculateFontSize(45)),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "DAKİKA",
                            style: TextStyle(
                              fontFamily: "familybir",
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.calculateFontSize(24),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          DottedBorder(
                            strokeWidth: 3,
                            color: Constants.anaRenkIcon.withOpacity(0.4),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            dashPattern: [5, 4],
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Constants.takvimContainerRenk,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "01",
                                style: TextStyle(
                                    fontSize: Constants.calculateFontSize(45)),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "SANİYE",
                            style: TextStyle(
                              fontFamily: "familybir",
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.calculateFontSize(24),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          DottedBorder(
                            strokeWidth: 3,
                            color: Constants.anaRenkIcon.withOpacity(0.4),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            dashPattern: [5, 4],
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Constants.takvimContainerRenk,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "01",
                                style: TextStyle(
                                    fontSize: Constants.calculateFontSize(45)),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "SALİSE",
                            //" 60 salise & 1000 milisaniye",
                            style: TextStyle(
                              fontFamily: "familybir",
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.calculateFontSize(24),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

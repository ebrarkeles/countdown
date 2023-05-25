import 'dart:async';
import 'package:countdown_flutter/constants/constants.dart';
import 'package:countdown_flutter/constants/hours.dart';
import 'package:countdown_flutter/constants/seconds.dart';
import 'package:countdown_flutter/constants/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/minutes.dart';

class NewCountForm extends StatefulWidget {
  const NewCountForm({super.key});

  @override
  State<NewCountForm> createState() => _NewCountFormState();
}

class _NewCountFormState extends State<NewCountForm> {
  String sayacTitle = "Sayaç";
  late FocusNode _focusNode;
  var formKey = GlobalKey<FormState>();

  Timer? timer;
  Duration duration = Duration();
  DateTime suAn = DateTime.now();
  TimeOfDay suAnSaat = TimeOfDay.fromDateTime(DateTime.now());

  int currentMinutesSayac = 0;
  int currentHoursSayac = 0;
  int currentSecondsSayac = 0;

  late FixedExtentScrollController _controllerMinutes;
  late FixedExtentScrollController _controllerHours;
  late FixedExtentScrollController _controllerseconds;

  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {}
      });
    });
    _controllerMinutes = FixedExtentScrollController();
    _controllerHours = FixedExtentScrollController();
    _controllerseconds = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    List<int> sayacZamani = [
      currentHoursSayac,
      currentMinutesSayac,
      currentSecondsSayac
    ];

    DateTime sayacZamaniDateTime = DateTime(date.year, date.month, date.day,
        sayacZamani[0], sayacZamani[1], sayacZamani[2]);
    print(sayacZamaniDateTime.toString().split(".")[0]);

    return Column(
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
          color: Constants.ikinciRenk,
          child: SizedBox(
            height: UIHelper.getNewSayacFormWAppbarHeight(),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: UIHelper.getNewSayacFormApppbarIconPadding(),
                    child: IconButton(
                        alignment: Alignment.centerLeft,
                        iconSize: Constants.getNewSayacIconSize(),
                        color: Colors.grey.shade200,
                        onPressed: () {
                          Navigator.of(context).maybePop();
                        },
                        icon: const Icon(
                          Icons.close,
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: UIHelper.getNewSayacFormApppbarIconPadding(),
                    child: IconButton(
                        alignment: Alignment.centerRight,
                        iconSize: Constants.getNewSayacIconSize(),
                        onPressed: () {
                          Navigator.pushNamed(context, "/CountdownPage",
                              arguments: sayacZamani);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => CountdownPagePaket()
                          // )
                          // );
                          // bool _validate = formKey.currentState!.validate();
                          // if (_validate) {
                          //   formKey.currentState!.save();
                          // }
                        },
                        icon: Text(
                          "Save",
                          style: Constants.getNewSayacSaveButtonTextStyle(),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Form(
          child: Column(
            children: [
              _buildTextFormField(),
              Text(sayacZamaniDateTime.toString()),
              // Text(toplamSn(sayacZamani).toString()),
              // Text(saniyeyeCevir(sayacZamani).toString()),
              // Text("${kalanZamaniBul(sayacZamani).toString()} "),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      "Tarih Seçiniz  :",
                      style: TextStyle(
                          fontFamily: "familybir",
                          fontSize: Constants.calculateFontSize(18),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    color: Colors.white70,
                    child: TextButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: date,
                            lastDate: DateTime(2100));

                        // if 'CANCEL' => null
                        if (newDate == null) return;

                        // if 'OK' => DateTime
                        setState(() {
                          date = newDate;
                        });
                      },
                      child: Text(
                        "${date.day} / ${date.month} / ${date.year}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Constants.calculateFontSize(23),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      "Saat Seçiniz  :",
                      style: TextStyle(
                          fontFamily: "familybir",
                          fontSize: Constants.calculateFontSize(18),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    color: Colors.white70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _listWheelScroolHours(),
                        SizedBox(width: 5.w),
                        Text(":",
                            style: TextStyle(
                                fontSize: Constants.calculateFontSize(18),
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5.w),
                        _listWheelScroolMinutes(),
                        SizedBox(width: 5.w),
                        Text(":",
                            style: TextStyle(
                                fontSize: Constants.calculateFontSize(18),
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5.w),
                        _listWheelScroolSeconds()
                      ],
                    ),
                  ),
                ],
              ),
              // Text(
              //     "Saat :${currentHours.toString()}, dakika : ${currentMinutes.toString()}, saniye : ${currentSeconds.toString()}"),
            ],
          ),
        ),
      ],
    );
  }

  _buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        onSaved: (title) {
          setState(() {
            sayacTitle = title!;
          });
        },
        validator: (s) {
          if (s!.isEmpty) {
            s = sayacTitle;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
          contentPadding: EdgeInsets.all(8.w),
          labelText: "Geri Sayım İsmi",
          hintText: sayacTitle,
          filled: true,
        ),
      ),
    );
  }

  _listWheelScroolMinutes() {
    return SizedBox(
      height: 80.h,
      width: 45.h,
      child: ListWheelScrollView.useDelegate(
          onSelectedItemChanged: (secilenDakika) {
            setState(() {
              currentMinutesSayac = secilenDakika;
            });
          },
          // Ya bu şekilde seçilen değere erişiriz.Ya da controller kullanırız.
          controller: _controllerMinutes,
          itemExtent: 40,
          perspective: 0.009,
          diameterRatio: 1.2,
          physics: FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: 60,
            builder: (context, index) {
              return MyMinutes(
                mins: index,
              );
            },
          )),
    );
  }

  _listWheelScroolHours() {
    return SizedBox(
      height: 80.h,
      width: 45.h,
      child: ListWheelScrollView.useDelegate(
          onSelectedItemChanged: (secilenSaat) {
            setState(() {
              currentHoursSayac = secilenSaat;
            });
          },
          controller: _controllerHours,
          itemExtent: 40,
          perspective: 0.009,
          diameterRatio: 1.2,
          physics: FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: 25,
            builder: (context, index) {
              return MyHours(
                hours: index,
              );
            },
          )),
    );
  }

  _listWheelScroolSeconds() {
    return SizedBox(
      height: 80.h,
      width: 45.h,
      child: ListWheelScrollView.useDelegate(
          onSelectedItemChanged: (secilenSaniye) {
            setState(() {
              currentSecondsSayac = secilenSaniye;
            });
          },
          controller: _controllerseconds,
          itemExtent: 40,
          perspective: 0.009,
          diameterRatio: 1.2,
          physics: FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: 60,
            builder: (context, index) {
              return MySeconds(
                secs: index,
              );
            },
          )),
    );
  }

/*
import 'package:countdown_flutter/constants/constants.dart';
import 'package:countdown_flutter/constants/ui_helper.dart';
import 'package:countdown_flutter/main.dart';
import 'package:countdown_flutter/pages/countdown_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:date_format/date_format.dart';

class NewCountdownBottomSheet extends StatefulWidget {
  const NewCountdownBottomSheet({super.key});

  @override
  State<NewCountdownBottomSheet> createState() => _NewCountdownBottomSheetState();
}

class _NewCountdownBottomSheetState extends State<NewCountdownBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  String sayacTitle = "Sayaç";

  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now();
    DateTime yirmiYilSonrasi = DateTime(2023, suan.year + 20);
    TimeOfDay suanSaat = TimeOfDay.now();

    return SafeArea(
      child: Scaffold(
          backgroundColor: Constants.anaRenk,
          //FORM SAYFASI APPBAR
          appBar: AppBar(
            toolbarHeight: UIHelper.getNewSayacFormWAppbarHeight(),
            primary: false,
            shape: Constants.formAppbarShape(),
            elevation: 10,
            backgroundColor: Constants.anaRenk2,
            automaticallyImplyLeading: false,
            title: Constants.NexSayacAppBarTitle,
            actions: [
              Expanded(
                child: Padding(
                  padding: UIHelper.getNewSayacFormApppbarIconPadding(),
                  child: IconButton(
                      alignment: Alignment.centerLeft,
                      iconSize: Constants.getNewSayacIconSize(),
                      color: Colors.grey.shade200,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ));
                      },
                      icon: const Icon(
                        Icons.close,
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: UIHelper.getNewSayacFormApppbarIconPadding(),
                  child: IconButton(
                      alignment: Alignment.centerRight,
                      iconSize: Constants.getNewSayacIconSize(),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CountdownPage(),
                        ));
                        bool _validate = _formKey.currentState!.validate();
                        if (_validate) {
                          _formKey.currentState!.save();
                        }
                      },
                      icon: Text(
                        "Save",
                        style: Constants.getNewSayacSaveButtonTextStyle(),
                      )),
                ),
              ),
            ],
          ),

          //FORM SAYFASI BODY
          body: SingleChildScrollView(
            child: Padding(
              padding: UIHelper.getFormPadding(),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  //sayaç adı formu
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Sayaç",
                    ),
                    onSaved: (title) {
                      sayacTitle = title!;
                    },
                    validator: (title) {
                      if (title!.isEmpty) {
                        return sayacTitle;
                      } else
                        return title;
                    },
                  ),
                  // tarih seç butonu
                  ElevatedButton(
                    child: const Text("TARİH SEÇ"),
                    onPressed: () {
                      /* showDatePicker(
                              context: context,
                              initialDate: suan,
                              firstDate: suan,
                              lastDate: yirmiYilSonrasi)
                          .then((secilenTarih) =>
                              debugPrint(secilenTarih.toString())); */
                    },
                    // saat seç butonu
                  ),
                  ElevatedButton(
                    child: const Text("Saat Seç"),
                    onPressed: () {
                      /*  showTimePicker(context: context, initialTime: suanSaat)
                          .then((secilenSaat) =>
                              debugPrint(secilenSaat?.format(context))); */
                    },
                  )
                ]),
              ),
            ),
          )),
    );
  }
}

 */

  // int toplamSn(List<int> list) {
  //   int sn = list[2];
  //   int min = list[1];
  //   int hrs = list[0];
  //   int toplamSn = sn + (min * 60) + ((hrs * 60) * 60);
  //   print(toplamSn);
  //   return toplamSn;
  // }

  // Duration saniyeyeCevir(List<int> list) {
  //   int sn = list[2];
  //   int min = list[1];
  //   int hrs = list[0];
  //   Duration durationListtenGelen =
  //       Duration(hours: hrs, minutes: min, seconds: sn);
  //   setState(() {});
  //   return durationListtenGelen;
  // }

  // decreaseSeconds(List<int> list) {
  //   var KalanEksiBirSn = saniyeyeCevir(list).inSeconds - 1;
  //   setState(() {
  //     int newSeconds = toplamSn(list) - KalanEksiBirSn;
  //     if (newSeconds == suAn) {
  //       timer?.cancel();
  //     } else {
  //       duration = Duration(seconds: newSeconds);
  //     }
  //   });
  // }

  // kalanZamaniBul(List<int> list) {
  //   timer = Timer.periodic(
  //     Duration(seconds: 1),
  //     (timer) => decreaseSeconds(list),
  //   );
  //   return Text("${timer} ".toString());
  // }

  //int gunHesaplama(List list) {}
}

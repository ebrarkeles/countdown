import 'package:countdown_flutter/constants/constants.dart';
import 'package:countdown_flutter/constants/hours.dart';
import 'package:countdown_flutter/constants/minutes.dart';
import 'package:countdown_flutter/constants/seconds.dart';
import 'package:countdown_flutter/constants/ui_helper.dart';
import 'package:countdown_flutter/pages/alarm_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewAlarmForm extends StatefulWidget {
  const NewAlarmForm({super.key});

  @override
  State<NewAlarmForm> createState() => _NewAlarmFormState();
}

class _NewAlarmFormState extends State<NewAlarmForm> {
  String sayacTitle = "Alarm";
  late FocusNode _focusNode;
  var formKey = GlobalKey<FormState>();

  int currentMinutesAlarm = 0;
  int currentHoursAlarm = 0;
  int currentSecondsAlarm = 0;

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
    List<int> alarmZamani = [
      currentHoursAlarm,
      currentMinutesAlarm,
      currentSecondsAlarm
    ];
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
                          Navigator.pushNamed(context, "/AlarmPage",
                              arguments: alarmZamani);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => AlarmPage(),
                          // ));
                          // bool _validate;
                          // _validate = formKey.currentState!.validate();
                          // if (_validate) {
                          //   formKey.currentState!.save();
                          //   formKey.currentState!.reset();
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
              _buildTextFormField(formKey),
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
                      "Saat Seçiniz",
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
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: Constants.calculateFontSize(18),
                              fontWeight: FontWeight.bold),
                        ),
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

  _buildTextFormField(Key key) {
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
            s = ("$sayacTitle");
          } else {
            return s;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
          contentPadding: EdgeInsets.all(8.w),
          labelText: "Alarm İsmi",
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
              currentMinutesAlarm = secilenDakika;
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
              currentHoursAlarm = secilenSaat;
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
              currentSecondsAlarm = secilenSaniye;
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
}

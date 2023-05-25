import 'package:countdown_flutter/constants/constants.dart';
import 'package:countdown_flutter/model/sayac.dart';
import 'package:countdown_flutter/widgets/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCenter extends StatefulWidget {
  const HomeCenter({super.key});

  @override
  State<HomeCenter> createState() => _HomeCenterState();
}

class _HomeCenterState extends State<HomeCenter> {
  @override
  Widget build(BuildContext context) {
    List<Sayac> tumSayaclar = Constants.tumEklenenSayaclar;
    if (tumSayaclar.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text((tumSayaclar[index].description.toString())),
              leading: CircleAvatar(
                backgroundColor: Constants.anaRenk,
                child: Text(""),
              ),
              subtitle: Column(),
            ),
          );
        },
      );
    } else {
      if (ScreenUtil().orientation == Orientation.portrait) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 65.h),
            ClockView(),
            SizedBox(height: 65.h),
            Text(
              Constants.isEmptyCenterText,
              style: Constants.getIsEmptyCenterTextStyle(),
            ),
            SizedBox(height: 310.h),
          ],
        );
      } else {
        return SingleChildScrollView(
          child: Row(
            children: [
              SizedBox(width: 20.w),
              ClockView(),
              SizedBox(width: 30.w),
              Text(
                Constants.isEmptyCenterText,
                style: Constants.getIsEmptyCenterTextStyle(),
              ),
            ],
          ),
        );
      }
      ;
    }
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountdownPagePaket extends StatefulWidget {
  CountdownPagePaket({super.key});

  @override
  State<CountdownPagePaket> createState() => _CountdownPagePaketState();
}

class _CountdownPagePaketState extends State<CountdownPagePaket> {
  static const countdownDuration = Duration(seconds: 10);
  Duration duration = Duration();
  Timer? timer;

  bool? isCountdown = true;

  @override
  void initState() {
    super.initState();
    //startTimer();
    reset();
  }

  void reset() {
    if (isCountdown == true) {
      setState(() {
        duration = countdownDuration;
      });
    } else {
      setState(() {
        duration = Duration();
      });
    }
  }

  void addTime() {
    final addSeconds = isCountdown == true ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer({bool resets = true}) {
    if (resets == true) {
      reset();
    }

    timer = Timer.periodic(Duration(seconds: 1), (timer) => addTime());
  }

  stopTimer({bool resets = true}) {
    if (resets == true) {
      reset();
    }

    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    late List<int> gelenZamanSayac =
        ModalRoute.of(context)!.settings.arguments as List<int>;
    debugPrint("secilip gelen saat: ${gelenZamanSayac[0]}");
    debugPrint("secilip gelen dakika: ${gelenZamanSayac[1]}");
    debugPrint("secilip gelen saniye: ${gelenZamanSayac[2]}");

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: isCountdownButton()),
          Column(
            children: [
              Text("${gelenZamanSayac}"),
              Center(child: buildTime()),
              SizedBox(height: 50.h),
              Center(child: buildButtons()),
            ],
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  isCountdownButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.black),
        onPressed: () {
          setState(() {
            isCountdown == true ? isCountdown = false : true;
          });
        },
        child: isCountdown == true
            ? Text("Sayaç Çalıştır", style: TextStyle(color: Colors.white))
            : Text("Gerisayım Çlıştır", style: TextStyle(color: Colors.white)));
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return (isRunning == true || !isCompleted)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    if (isRunning) {
                      stopTimer(resets: false);
                    } else {
                      startTimer(resets: false);
                    }
                  },
                  child: isRunning
                      ? Text(
                          "STOP",
                          style: TextStyle(color: Colors.black),
                        )
                      : Text(
                          "RESUME",
                          style: TextStyle(color: Colors.black),
                        )),
              SizedBox(width: 12.w),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: stopTimer,
                  child: Text(
                    "CANCEL",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: () {
              startTimer();
            },
            child: Text(
              "Start Timer",
              style: TextStyle(color: Colors.black),
            ));
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours.remainder(24));

    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return
        // Text(
        //   "$minutes:$seconds",
        //   style: TextStyle(fontSize: 80),
        // );
        Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: hours, header: "HOURS"),
        SizedBox(width: 8.w),
        buildTimeCard(time: minutes, header: "MINUTES"),
        SizedBox(width: 8.w),
        buildTimeCard(time: seconds, header: "SECONDS"),
      ],
    );
  }

  buildTimeCard({required String time, required String header}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Text(
            time,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 72),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          header,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        // pi 180 derece.. - dedik çünkü saat yönünün tersinde hareket etmesi lazım
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

/* 60 sec - 360, 1 sec 6 derece
*/

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.width / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);
    var outlineBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.orange.shade300
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var minHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    var hourHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    /* var secHandX = centerX + 80 * (cos(90 * pi / 180));
    var secHandY = centerX + 80 * (sin(90 * pi / 180)); */
    // -->
    var secHandX = centerX + 80 * (cos(dateTime.second * 6 * pi / 180));
    var secHandY = centerX + 80 * (sin(dateTime.second * 6 * pi / 180));
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    var minHandX = centerX + 80 * (cos(dateTime.minute * 6 * pi / 180));
    var minHandY = centerX + 80 * (sin(dateTime.minute * 6 * pi / 180));

    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var hourHandX = centerX + 60 * cos(dateTime.hour * 30 * pi / 180);
    var hourHandY = centerX + 60 * sin(dateTime.hour * 30 * pi / 180);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);
    canvas.drawCircle(center, 16, centerFillBrush);

//saatin etrafındaki çizgiler

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;

    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => true;
}

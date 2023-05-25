import 'package:countdown_flutter/constants/constants.dart';
import 'package:countdown_flutter/model/data_helper.dart';
import 'package:countdown_flutter/model/sayac.dart';
import 'package:flutter/material.dart';

class CountDownPage extends StatefulWidget {
  const CountDownPage({super.key});

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  @override
  Widget build(BuildContext context) {
    Constants.tumEklenenSayaclar = [
      Sayac(DateTime.now(),
          gradientColors: GradientColors.fire, description: "Wedding")
    ];

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }
}

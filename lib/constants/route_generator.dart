// import 'package:countdown_flutter/main.dart';
// import 'package:countdown_flutter/pages/countdown_page_paket.dart';
// import 'package:countdown_flutter/pages/new_countdown.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class RouteGenerator {
//   static Route<dynamic> _routeOlustur(
//       Widget gidilecekWidget, RouteSettings settings) {
//     if (defaultTargetPlatform == TargetPlatform.iOS) {
//       return CupertinoPageRoute(
//         settings: settings,
//         builder: (context) => gidilecekWidget,
//       );
//     } else if (defaultTargetPlatform == TargetPlatform.android)
//       // ignore: curly_braces_in_flow_control_structures
//       return MaterialPageRoute(
//         settings: settings,
//         builder: (context) => gidilecekWidget,
//       );
//     else
//       // ignore: curly_braces_in_flow_control_structures
//       return CupertinoPageRoute(
//         settings: settings,
//         builder: (context) => gidilecekWidget,
//       );
//   }

//   static Route<dynamic>? routeGenerator(RouteSettings settings) {
//     switch (settings.name) {
//       case "/":
//         return _routeOlustur(MyHomePage(), settings);
//       case "/CountdownPage":
//         var parametredekiZaman = settings.arguments as Zaman;
//         return _routeOlustur(
//             CountdownPagePaket(secilenZaman: parametredekiZaman), settings);
//     }
//   }
// }

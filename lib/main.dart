import 'package:countdown_flutter/constants/constants.dart';
import 'package:countdown_flutter/constants/ui_helper.dart';
import 'package:countdown_flutter/pages/alarm_page.dart';
import 'package:countdown_flutter/pages/countdown_page_paket.dart';
import 'package:countdown_flutter/pages/new_countdown.dart';
import 'package:countdown_flutter/widgets/home_center.dart';
import 'package:countdown_flutter/widgets/homepage_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(423.5, 897.1),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          routes: {
            "/": (context) => MyHomePage(),
            "/NewCountdown": (context) => NewCountForm(),
            "/CountdownPage": (context) => CountdownPagePaket(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == "/CountdownPage") {
              final List<int> sayacZamani = settings.arguments as List<int>;
              return _routeOlustur(CountdownPagePaket(), settings);
            } else if (settings.name == "/AlarmPage") {
              final List<int> alarmZamani = settings.arguments as List<int>;
              return _routeOlustur(AlarmPage(), settings);
            }
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text("404"),
                ),
                body: Center(
                  child: Text("Sayfa Bulunamadı"),
                ),
              ),
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Clock',
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          //home: const MyHomePage(),
        );
      },
    );
  }

  static Route<dynamic>? _routeOlustur(
      Widget gidilecekWidget, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.anaRenk,
        appBar: const HomePageAppBar(),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Padding(
              padding: UIHelper.getAppTitlePadding(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Expanded(child: UIHelper.getHomeCenter(context))],
              ),
            );
          },
        ),
      ),
    );
  }
}

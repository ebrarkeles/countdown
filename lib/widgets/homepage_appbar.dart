import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/ui_helper.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
        primary: true,
        toolbarHeight: UIHelper.getNewSayacFormWAppbarHeight(),
        elevation: 10,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF444974),
        shape: Constants.formAppbarShape(),
        title: Text(
          Constants.title,
          style: Constants.getTitleTextStyle(),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

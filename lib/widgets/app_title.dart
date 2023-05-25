import 'package:countdown_flutter/constants/constants.dart';
import 'package:countdown_flutter/constants/ui_helper.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../pages/countdown_page.dart';

class NewCountdownAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: UIHelper.getNewSayacFormWAppbarHeight(),
      primary: true,
      shape: Constants.formAppbarShape(),
      elevation: 10,
      backgroundColor: Color(0xFF444974),
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
                    builder: (context) => CountDownPage(),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

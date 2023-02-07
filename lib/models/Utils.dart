import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../screens/Account/LoginScreen.dart';
import '../theme/app_theme.dart';
import 'AppConfig.dart';

class Utils {

  static void init_theme() {
    AppTheme.resetFont();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: CustomTheme.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: CustomTheme.primary));
  }

  static navigate_to(String screen, context, {dynamic data: null}) {
    switch (screen) {
      case AppConfig.LoginScreen:
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => LoginScreen(),
            transitionDuration: Duration.zero,
          ),
        );
        break;
    }

  }
    static toast(String message, {color: Colors.green}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength:
        (message.length < 20) ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
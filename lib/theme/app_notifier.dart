import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:mshop/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../theme/theme_type.dart';
import 'app_theme.dart';
import 'material_theme.dart';

class AppNotifier extends ChangeNotifier {
  int counter = 1;



  void increment() {
    counter++;
    notifyListeners();
  }

  AppNotifier() {
    init();
  }

  init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    ThemeType themeType =
        sharedPreferences.getString("theme_mode").toString().toThemeType;
    _changeTheme(themeType);
    notifyListeners();
  }

  updateTheme(ThemeType themeType) {
    _changeTheme(themeType);

    notifyListeners();

    updateInStorage(themeType);
  }

  Future<void> updateInStorage(ThemeType themeType) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("theme_mode", themeType.toText);
  }

  void changeDirectionality(TextDirection textDirection, [bool notify = true]) {
    AppTheme.textDirection = textDirection;
    FxAppTheme.textDirection = textDirection;

    if (notify) notifyListeners();
  }

  void _changeTheme(ThemeType themeType) {
    AppTheme.themeType = themeType;
    AppTheme.customTheme = AppTheme.getCustomTheme(themeType);
    AppTheme.theme = AppTheme.getTheme(themeType);
    MaterialTheme.resetThemeData();
    AppTheme.changeFxTheme(themeType);
  }


}

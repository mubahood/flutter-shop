import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

import '../theme/app_theme.dart';

extension IconExtension on Icon {
  Icon autoDirection() {
    if (AppTheme.textDirection == TextDirection.ltr) return this;
    if (icon == Icons.chevron_right) {
      return Icon(
        Icons.chevron_left,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    } else if (icon == Icons.chevron_left) {
      return Icon(
        Icons.chevron_right,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    } else if (icon == Icons.chevron_left) {
      return Icon(
        Icons.chevron_right,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    } else if (icon == Icons.chevron_right) {
      return Icon(
        Icons.chevron_left,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    }
    return this;
  }
}

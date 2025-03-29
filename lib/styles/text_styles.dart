import 'package:flutter/material.dart';
import 'package:flutter_sqflite/styles/app_sizes.dart';

import 'app_colors.dart';

class TextStyles {
  static TextStyle regularInterFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle mediumInterFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle boldInterFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle extraBoldInterFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle blackInterFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle regularRobotoMonoFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      fontFamily: 'RobotoMono',
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle mediumRobotoMonoFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      fontFamily: 'RobotoMono',
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle boldRobotoMonoFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      fontFamily: 'RobotoMono',
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w700,
    );
  }
}

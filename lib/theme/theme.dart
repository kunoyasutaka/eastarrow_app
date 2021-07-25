import 'package:eastarrow_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData myTheme() => ThemeData(
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: AppColors.ocher).copyWith(
        secondary: AppColors.grey,
      ),

      ///背景の色をに薄いグレーを設定
      scaffoldBackgroundColor: AppColors.ocher.shade50,

      ///メインフォントを'NotoSerifJP'に設定
      fontFamily: 'NotoSerifJP',

      ///サブフォントを'NotoSansJP'に設定
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          fontFamily: 'NotoSansJP',
          color: AppColors.grey,
        ),
      ),

      ///アプリバーの背景の色をwhiteに設定
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.navyBlue,
      ),

      ///バーの文字の色をblackに設定
      primaryTextTheme: const TextTheme(
        headline6: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),

      ///アプリバーのアイコンの色をprimaryに設定
      primaryIconTheme: const IconThemeData.fallback().copyWith(
        color: AppColors.ocher,
      ),
    );

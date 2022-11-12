import 'package:flutter/material.dart';
import 'package:movie_app/core/global/app_colors/app_dark_colors.dart';

ThemeData getThemeDataDark(BuildContext context) => ThemeData(
      primaryColor: AppDarkColors.primaryColor,
      appBarTheme: const  AppBarTheme(
        color: AppDarkColors.appBarColor,

      ),
      scaffoldBackgroundColor: AppDarkColors.scaffoldBackgroundColor,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppDarkColors.primaryColor, //black
            displayColor: AppDarkColors.primaryColor,
          ),


      inputDecorationTheme:
      const InputDecorationTheme(
        hintStyle: TextStyle(color : AppDarkColors.primaryColor) ,
        border: InputBorder.none,

      ),
    );

import 'package:flutter/material.dart';
import 'package:movie_app/core/global/app_colors/app_light_colors.dart';

ThemeData getThemeDataLight(BuildContext context) => ThemeData(
    primaryColor: AppLightColors.primaryColor,
    scaffoldBackgroundColor: AppLightColors.scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
        color: AppLightColors.appBarColor
    ),
    textTheme: Theme.of(context).textTheme.apply(
        bodyColor:AppLightColors.primaryColor,
        displayColor: AppLightColors.primaryColor,
    )

);
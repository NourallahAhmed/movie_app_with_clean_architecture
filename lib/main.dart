import 'package:flutter/material.dart';
import 'package:movie_app/core/global/themes/light_theme.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/movie_module/presentation/screens/movies_screen.dart';

import 'core/global/themes/dark_theme.dart';
import 'core/utils/app_constants.dart';

void main() {
  // serviceLocator.registerSingleton<ServiceLocator>(ServiceLocator(),
  //     signalsReady: true);
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build");

    return MaterialApp(

      debugShowCheckedModeBanner:  false,

      theme: getThemeDataDark(context),
      home:  const MainMoviesScreen(),
    );
  }
}


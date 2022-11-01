import 'package:flutter/material.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/movie_module/presentation/screens/movies_screen.dart';

void main() {
  // serviceLocator.registerSingleton<ServiceLocator>(ServiceLocator(),
  //     signalsReady: true);

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
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MainMoviesScreen(),
    );
  }
}


import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:papa_02_carrot/router/router_delegate.dart';
import 'package:papa_02_carrot/views/splash_screen.dart';
import 'package:papa_02_carrot/utils/logger.dart';

void main() {
  logger.d("app Start");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2), () => 100),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          child: initApp(snapshot),
          duration: const Duration(seconds: 1),
        );
      },
    );
  }

  Widget initApp(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasData) {
      return const TomatoApp();
    } else {
      return const SplashScreen();
    }
  }
}

class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Jalnan',
        hintColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black87, fontFamily: 'Jalnan'),
            elevation:2
        ),
      ),
    );
  }
}

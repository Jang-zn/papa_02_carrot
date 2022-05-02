import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:papa_02_carrot/router/router_delegate.dart';
import 'package:papa_02_carrot/states/user_provider.dart';
import 'package:papa_02_carrot/views/splash_screen.dart';
import 'package:papa_02_carrot/utils/logger.dart';
import 'package:provider/provider.dart';

void main() {
  logger.d("app Start");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      return ChangeNotifierProvider<UserProvider>(
          create: (BuildContext context) {
            return UserProvider();
          },
          child: TomatoApp());
    } else {
      return const SplashScreen();
    }
  }
}

class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //<T>에서 어떤 프로바이더인지 명시해준다.
    //이제 하위 위젯에서 전부 UserProvider에 접근 가능
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Jalnan',
        hintColor: Colors.grey[300],
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          primary: Colors.white,
          minimumSize: const Size(48, 48),
        )),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle:
                TextStyle(color: Colors.black87, fontFamily: 'Jalnan'),
            elevation: 2),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter demo",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home:const MyAppPage(),
    );
  }
}



class MyAppPage extends StatefulWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  State<MyAppPage> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:CircularProgressIndicator(
          color: Colors.red,
        )
      )
    );
  }
}


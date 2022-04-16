import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        Image.asset('assets/imgs/woou3.jpg'),
        const SizedBox(height:20),
        const CircularProgressIndicator(
          color: Colors.red,
        )
      ]),
    ));
  }
}

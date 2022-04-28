// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:papa_02_carrot/views/start/intro.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          IntroPage(pageController),
          Container(
            color:Colors.accents[2],
          ),
          Container(
            color:Colors.accents[5],
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:papa_02_carrot/views/start/address_page.dart';
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
          AddressPage(),
          Container(
            color:Colors.accents[5],
          ),
        ],
      ),
    );
  }
}

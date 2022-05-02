
import 'package:flutter/material.dart';
import 'package:papa_02_carrot/views/start/address_page.dart';
import 'package:papa_02_carrot/views/start/auth_page.dart';
import 'package:papa_02_carrot/views/start/intro_page.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          IntroPage(pageController),
          const AddressPage(),
          const AuthPage(),
        ],
      ),
    );
  }
}

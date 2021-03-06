// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/user_provider.dart';
import '../../utils/logger.dart';

class IntroPage extends StatelessWidget {
  IntroPage(this.pageController, {Key? key,}) : super(key: key);

  PageController pageController;

  void onButtonClick() {
    pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    logger.d("current user : ${context.read<UserProvider>().userState}");
    return LayoutBuilder(
      builder: (context, constraints) {
        //maybeOf 로 medaiQuery 있는지 없는지도 확인 가능
        Size size = MediaQuery.of(context).size;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Tomato Market",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width:size.width-32,
                  child: Stack(
                    children: [
                      ExtendedImage.asset('assets/imgs/carrot_intro.png'),
                      Positioned(
                        child: ExtendedImage.asset(
                          'assets/imgs/carrot_intro_pos.png',
                        ),
                        left: (size.width-32)*0.45,
                        right: (size.width-32)*0.45,
                        top: (size.width-32)*0.45,
                        bottom: (size.width-32)*0.45,
                      ),
                    ],
                  ),
                ),
                const Text(
                  '우리동네 중고 직거래 토마토마켓',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '토마토마켓은 동네 직거래 마켓이에요'
                      '\n내 동네를 설정하고 시작해보세요',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      child: const Text(
                        "내 동네 설정하고 시작하기",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: onButtonClick,
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

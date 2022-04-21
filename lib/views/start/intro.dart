import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:papa_02_carrot/utils/logger.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  void onButtonClick() {
    logger.d('on textButton Click');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
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
            ExtendedImage.asset('assets/imgs/carrot_intro.png',height: MediaQuery.of(context).size.height*0.4,),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
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
  }
}

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ExtendedImage.asset('assets/imgs/woou3.jpg'),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../constant/common_constant.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);
  final inputBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));
  final TextEditingController phoneController = TextEditingController(text:"010");


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;

        return Scaffold(
          appBar: AppBar(
            title: const Text("전화번호 로그인"),
            leading: const Icon(Icons.phone, color: Colors.black87),
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(commonPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    ExtendedImage.asset(
                      'assets/imgs/lock.png',
                      width: size.width * 0.15,
                    ),
                    Text('''당근마켓은 휴대폰 번호로 가입해요.
번호는 안전하게 보관되며 
어디에도 공개되지 않아요''', style: Theme.of(context).textTheme.subtitle2),
                  ],
                ),
                const SizedBox(
                  height: commonPadding,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(border: inputBorder),
                  inputFormatters: [MaskedInputFormatter("000-0000-0000")],
                  keyboardType: TextInputType.phone,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

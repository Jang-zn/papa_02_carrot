import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);
  final inputBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

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
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    ExtendedImage.asset(
                      'assets/imgs/lock.png',
                      width: size.width * 0.15,
                    ),
                    const Text('''당근마켓은 휴대폰 번호로 가입해요.
번호는 안전하게 보관되며 
어디에도 공개되지 않아요'''),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(border: inputBorder),
              )
            ],
          ),

        );
      },
    );
  }
}

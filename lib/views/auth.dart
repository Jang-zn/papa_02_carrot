import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          const Center(
            child: Text("Need Auth"),
          ),
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

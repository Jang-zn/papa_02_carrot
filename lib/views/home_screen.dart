import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.blue,
        child:const Center(
          child:Text("HomePage", style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold,))
        )
      ),
    );
  }
}

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:papa_02_carrot/constant/common_constant.dart';
import 'package:papa_02_carrot/states/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void userLogout(){
    context.read<UserProvider>().setUserAuth(false);
    Beamer.of(context,).beamToNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.blue,
        child:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HomePage", style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
              SizedBox(height:commonPadding),
              TextButton(
                child:Text("LogOut"),
                onPressed: userLogout,
              )
            ],
          )
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:papa_02_carrot/states/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        actions:[
          IconButton(onPressed: (){
            context.read<UserProvider>().setUserAuth(false);
            // Beamer.of(context).beamToReplacementNamed('/');
          },icon:const Icon(Icons.logout))
        ]
      ),
      body: Container(
        color:Colors.blue,

      ),
    );
  }
}

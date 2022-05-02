import 'package:beamer/beamer.dart';
import 'package:papa_02_carrot/states/user_provider.dart';
import 'package:papa_02_carrot/views/home_screen.dart';
import 'package:papa_02_carrot/views/start/auth_page.dart';
import 'package:papa_02_carrot/views/start_screen.dart';
import 'package:provider/provider.dart';


final routerDelegate = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes:{
      '/' : (context, state, data)=>StartScreen(),
      '/home':(context, state, data)=>HomeScreen(),
      '/auth':(context, state, data)=>AuthPage(),
    },
  ),

  //페이지 이동시 유효성검사 진행하는 guard
  guards: [
    BeamGuard(
      //Guard 검사할 route pattern
      pathPatterns: ['/home'],
      check: (context, location) {
        //유효성검사 로직
        //watch 사용시 값 변경시마다 참조됨 --> obx 개념
        print("state change : ${context.read<UserProvider>().userState}");
        return Provider.of<UserProvider>(context, listen: false).userState;
      },
      //check==false 일때 이동할 route
      beamToNamed: (origin, target)=>'/',

    ),
  ],
);

import 'package:beamer/beamer.dart';
import 'package:papa_02_carrot/router/locations.dart';
import 'package:papa_02_carrot/states/user_provider.dart';
import 'package:provider/provider.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      HomeLocation(),
    ],
  ),

  //페이지 이동시 유효성검사 진행하는 guard
  guards: [
    BeamGuard(
      pathPatterns: ['/'],
      check: (context, location) {
        //유효성검사 로직
        return context.watch<UserProvider>().userState;
      },
      beamToNamed: (origin, target)=>'/auth',
    ),
  ],
);

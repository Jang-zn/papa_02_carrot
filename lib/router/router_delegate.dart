import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:papa_02_carrot/router/home_location.dart';
import 'package:papa_02_carrot/states/user_provider.dart';
import 'package:papa_02_carrot/views/start/start_screen.dart';
import 'package:provider/provider.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: BeamerLocationBuilder(
    beamLocations:[HomeLocation(),]
  ),

  //페이지 이동시 유효성검사 진행하는 guard
  guards: [
    BeamGuard(
      pathBlueprints: ['/'],
      check: (BuildContext context, BeamLocation<BeamState> location) {
        return context.watch<UserProvider>().userState;
      },
      showPage: BeamPage(child:const StartScreen()),
    ),
  ],
);

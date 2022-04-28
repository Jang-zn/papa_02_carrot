import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:papa_02_carrot/views/start_screen.dart';
import 'package:papa_02_carrot/views/home.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    return [
      const BeamPage(
        child: HomeScreen(),
        key: ValueKey('home'),
      ),
      BeamPage(
        child: StartScreen(),
        key: const ValueKey('auth'),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/', '/auth'];
}

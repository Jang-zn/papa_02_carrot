import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:papa_02_carrot/views/auth.dart';
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
      const BeamPage(
        child: AuthScreen(),
        key: ValueKey('auth'),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/', '/auth'];
}

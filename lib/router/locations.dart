import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/'];
}

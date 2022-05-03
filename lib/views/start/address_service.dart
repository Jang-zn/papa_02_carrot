import 'package:dio/dio.dart';
import 'package:papa_02_carrot/utils/logger.dart';

class AddressService {
  void doiTest() async {
    var response = await Dio().get('https://randomuser.me/api/').catchError(
      (e) {
        logger.e(e);
      },
    );
    logger.d(response);
  }


}

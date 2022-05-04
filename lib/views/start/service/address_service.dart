import 'package:dio/dio.dart';
import 'package:papa_02_carrot/constant/key.dart';
import 'package:papa_02_carrot/utils/logger.dart';

class AddressService {

  void searchAddressByString(String address) async {
    //O/1 선택, M/1 필수
    final formData ={
      'key': VWORLD_KEY,
      'request':'search',
      'query' : address,
      'type' : 'ADDRESS',
      'category':'ROAD',
    };

    var response = await Dio()
        .get('http://api.vworld.kr/req/search',
              queryParameters:formData)
        .catchError((e) {
          logger.e(e.message);
        },
    );
    logger.d(response);
  }


}

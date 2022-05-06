import 'dart:math';

import 'package:dio/dio.dart';
import 'package:papa_02_carrot/constant/key.dart';
import 'package:papa_02_carrot/data/address_model.dart';
import 'package:papa_02_carrot/utils/logger.dart';

import '../../../data/location_model.dart';

class AddressService {

  Future<AddressModel> searchAddressByString(String address) async {
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
    //response가 Json형태 (Map)으로 날라온다
    AddressModel addressModel = AddressModel.fromJson(response.data['response']);
    return addressModel;
  }

  Future<LocationModel> findAddressByCoordinate({required double log, required double lat}) async {
    final formData ={
      'service':'address',
      'request':'getAddress',
      'key': VWORLD_KEY,
      'point' :'${log},${lat}',
      'type':'BOTH',
    };

    var response = await Dio()
        .get('http://api.vworld.kr/req/address',
        queryParameters:formData)
        .catchError((e) {
      logger.e(e.message);
    },);
  LocationModel locationModel = LocationModel.fromJson(response.data['response']);
  logger.d(response);
  logger.d(locationModel.toJson());
  return locationModel;
  }
}

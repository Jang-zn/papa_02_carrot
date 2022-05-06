// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:papa_02_carrot/data/address_model.dart';
import 'package:papa_02_carrot/views/start/service/address_service.dart';

import '../../data/location_model.dart';


class AddressPage extends StatefulWidget {
  AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _addressController = TextEditingController();

  AddressModel? _addressModel;
  LocationModel? _locationModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _addressController,
            onFieldSubmitted: (text) async {
              _addressModel = await AddressService().searchAddressByString(text);
              setState(() {});
            },
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 24, minHeight: 24),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
                hintText: '주소 검색',
                hintStyle: TextStyle(color: Theme.of(context).hintColor)),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor),
            onPressed: () async {

              //위치정보 사용동의
              Location location = new Location();

              bool _serviceEnabled;
              PermissionStatus _permissionGranted;
              LocationData _locationData;

              _serviceEnabled = await location.serviceEnabled();
              if (!_serviceEnabled) {
                _serviceEnabled = await location.requestService();
                if (!_serviceEnabled) {
                  return;
                }
              }

              _permissionGranted = await location.hasPermission();
              if (_permissionGranted == PermissionStatus.denied) {
                _permissionGranted = await location.requestPermission();
                if (_permissionGranted != PermissionStatus.granted) {
                  return;
                }
              }

              _locationData = await location.getLocation();
              _locationModel = await AddressService().findAddressByCoordinate(log:_locationData.longitude!, lat:_locationData.latitude!);
            },
            icon: Icon(CupertinoIcons.compass, color: Colors.white),
            label: Text(
              '현재위치로 찾기',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (_addressModel==null||_addressModel!.result==null||_addressModel!.result!.items==null)?0:_addressModel!.result!.items!.length,
              itemBuilder: (context, index) {
                if(_addressModel==null||_addressModel!.result==null||_addressModel!.result!.items==null||_addressModel!.result!.items![index].address==null) {
                  return Container();
                }
                return Container(
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    leading: Icon(Icons.image),
                    title: Text(
                      _addressModel!.result!.items![index].address!.road??""
                    ,style:TextStyle(fontSize: 14)),
                    subtitle: Text(_addressModel!.result!.items![index].address!.parcel??""),
                    trailing: Image.asset('assets/imgs/carrot_intro_pos.png', width: 20,),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

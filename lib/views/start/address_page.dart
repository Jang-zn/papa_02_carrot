// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/logger.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
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
            onPressed: () {},
            icon: Icon(CupertinoIcons.compass, color: Colors.white),
            label: Text(
              '현재위치로 찾기',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  color: Colors.accents[index],
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    leading: Icon(Icons.image),
                    title: Text(
                      "address$index",
                    ),
                    subtitle: Text("subtitle$index"),
                    trailing: Image.asset('assets/imgs/carrot_intro_pos.png'),
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

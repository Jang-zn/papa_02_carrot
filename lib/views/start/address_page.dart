// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(24),
      child: Column(children: [
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              prefixIconConstraints:
                  BoxConstraints(minWidth: 24, minHeight: 24),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.lightGreen),
            ),
            hintText: '주소 검색',
            hintStyle: TextStyle(color: Theme.of(context).hintColor)
          ),
        )
      ],),
    );
  }
}

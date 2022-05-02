import 'package:flutter/material.dart';

import '../utils/logger.dart';

class UserProvider extends ChangeNotifier{
  bool _userLoggedIn = false;

  void setUserAuth(bool authState){
    _userLoggedIn = authState;
    //상태관리 변수의 변경을 참조중인 위젯들에게 알려줌
    notifyListeners();
  }

  //userState의 getter
  bool get userState =>_userLoggedIn;
}
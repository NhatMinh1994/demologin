import 'package:flutter_login/ui/login/viewmodel/user.dart';
import 'package:flutter_login/model/login/LoginResult.dart';
import 'package:flutter_login/data/FetchDataException.dart';

abstract class LoginView{
  void onLoginSuccess(LoginResult loginResult) {}
  void onError(FetchDataException e);
}
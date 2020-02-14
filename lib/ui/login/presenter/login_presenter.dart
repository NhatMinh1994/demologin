import 'package:flutter_login/ui/login/viewmodel/user.dart';
import 'package:flutter_login/ui/login/views/login_component.dart';
import 'package:flutter_login/ui/login/views/login_view.dart';
import 'package:flutter_login/ui/di.dart';
import 'package:flutter_login/model/login/LoginResult.dart';
import 'package:flutter_login/model/login/LoginInput.dart';
import 'package:flutter_login/data/FetchDataException.dart';

class LoginPresenter{
  void onButtonLoginClick(LoginInput loginInput){}
  set loginView(LoginView view){}
}

class BasicLoginPresenter implements LoginPresenter{
  LoginView _loginView;
  LoginRepository _loginRepository;

  BasicLoginPresenter(this._loginView) {
    _loginRepository = new Injector().loginRepository;
  }

  @override
  void onButtonLoginClick(LoginInput loginInput) {
    _loginRepository.login(body: loginInput.toMap())
        .then((data) => _loginView.onLoginSuccess(data))
        .catchError((e) => _loginView.onError(new FetchDataException(e.toString())));
  }

  @override
  set loginView(LoginView value) {
    _loginView = value;
  }

}
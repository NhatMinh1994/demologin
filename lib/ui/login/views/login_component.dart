/*
Nguyen Duc Hoang (Mr)
Programming tutorial channel:
https://www.youtube.com/c/nguyenduchoang
Flutter,, React Native, IOS development, Swift, Python, Angular
TextInput and Button handlers
* */
import 'package:flutter/material.dart';
import 'package:flutter_login/data/FetchDataException.dart';
import 'package:flutter_login/ui/login/viewmodel/user.dart';
import 'package:flutter_login/ui/login/presenter/login_presenter.dart';
import 'package:flutter_login/ui/login/views/login_view.dart';
import 'package:flutter_login/model/login/LoginInput.dart';
import 'package:flutter_login/model/login/LoginResult.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_login/app_localizations.dart';
import 'package:flutter_login/ui/tabs/views/TabComponent.dart';

class LoginPageState extends State<LoginPage> implements LoginView{
   LoginInput user = new LoginInput();
   BasicLoginPresenter presenter;
   bool _loading = false;

  LoginPageState(){
    presenter = new BasicLoginPresenter(this);
  }
  @override
  void initState() {
    super.initState();
    presenter.loginView = this;
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    final TextField _txtUserName = new TextField(
      decoration:  new InputDecoration(
        hintText: AppLocalizations.of(context).translate('enter_your_name'),
        contentPadding: new EdgeInsets.all(10.0),
        border:  InputBorder.none,
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
      onChanged: (text) {
        setState((){
          this.user.username = text;
        });
      },
    );
    final TextField _txtEmail = new TextField(
      decoration:  new InputDecoration(
        hintText: 'Your email address',
        contentPadding: new EdgeInsets.all(10.0),
        border:  InputBorder.none,
      ),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      onChanged: (text) {
        setState((){
          this.user.username = text;
        });
      },
    );
    final TextField _txtPassword = new TextField(
      decoration:  new InputDecoration(
        hintText: 'Your password',
        contentPadding: new EdgeInsets.all(10.0),
        border:  InputBorder.none,
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
      obscureText: true,//secure your text entry, display ****
      onChanged: (text) {
        setState((){
          this.user.password = text;
        });
      },
    );
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login page example'),
      ),
      body: new Stack(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              new Container(
                margin: new EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                decoration: new BoxDecoration(
                    color: new Color.fromARGB(255, 240, 240, 240),
                    border: new Border.all(width: 1.2, color: Colors.black12),
                    borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                ),
                child: _txtUserName,
              ),
              new Container(
                margin: new
                EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                decoration: new BoxDecoration(
                    color: new Color.fromARGB(255, 240, 240, 240),
                    border: new Border.all(width: 1.2, color: Colors.black12),
                    borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                ),
                child: _txtEmail,
              ),
              new Container(
                margin: new EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                decoration: new BoxDecoration(
                    color: new Color.fromARGB(255, 240, 240, 240),
                    border: new Border.all(width: 1.2, color: Colors.black12),
                    borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                ),
                child: _txtPassword,
              ),
              new Container(
                margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                child:new Row(
                  children: <Widget>[
                    new Expanded(child: new RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: new Text("Login"),
                      onPressed: () {
                        setState(() {
                          this._loading = true;
                        });
                        this.user.client_id = "hisalon";
                        this.user.client_secret = "secret";
                        this.user.grant_type = "password";
                        this.user.username = '04testadmin';
                        this.user.password = '123456';
                        presenter.onButtonLoginClick(this.user);
                      },
                    )),
                  ],
                ) ,
              ),

            ],

          ),
          _loading ? loadingView() : Text(""),
        ],
      )
    );
  }

   Widget loadingView() => Center(
     child: new Scaffold(
       backgroundColor: Colors.black54,
       body: Center(
         child: CircularProgressIndicator(
           backgroundColor: Colors.red,
         ),
       )
     ),
   );
  @override
  void onLoginSuccess(LoginResult loginResult) {
    setState(() {
      this._loading = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabComponent()),
    );
    print('Username: ${loginResult.token_type}, '
        'email: ${loginResult.access_token}'
        ', password : ${loginResult.refresh_token}');
  }

  @override
  void onError(FetchDataException e) {
    setState(() {
      this._loading = false;
    });
    print('ALOLO');
  }
}
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}
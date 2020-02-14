
class LoginResult {
  String access_token;
  String token_type;
  String refresh_token;
  int expires_in;
  String scope;

  LoginResult({this.access_token,this.token_type, this.refresh_token, this.expires_in, this.scope});

  LoginResult.fromMap(Map<String, dynamic> map)
      : access_token = map['access_token'],
        token_type = map['token_type'],
        refresh_token = map['refresh_token'],
        expires_in = map['expires_in'],
        scope = map['scope'];
}

abstract class LoginRepository {
  Future<LoginResult> login({Map body});
}

class LoginInput {
   String client_id;
   String client_secret;
   String grant_type;
   String username;
   String password;

  LoginInput({this.client_id, this.client_secret, this.grant_type, this.username, this.password});

  factory LoginInput.fromJson(Map<String, dynamic> json) {
    return LoginInput(
      client_id: json['client_id'],
      client_secret: json['client_secret'],
      grant_type: json['grant_type'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["client_id"] = client_id;
    map["client_secret"] = client_secret;
    map["grant_type"] = grant_type;
    map["username"] = username;
    map["password"] = password;
    return map;
  }
}
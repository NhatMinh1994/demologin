import 'package:flutter_login/model/login/LoginResult.dart';
import 'package:flutter_login/data/login/LoginNetworkService.dart';
import 'package:flutter_login/data/hotel/NetworkService.dart';
import 'package:flutter_login/model/hotel/HotelData.dart';
class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  HotelRepository get hotelRepository => new HotelNetworkRepository();
  LoginRepository get loginRepository => new LoginNetworkRepository();
}
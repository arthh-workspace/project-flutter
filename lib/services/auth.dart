import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/models/dosen.dart';
import 'package:flutter_application_1/services/dio.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  User _user;
  Dosen _dosen;
  String _token;

  bool get authenticated => _isLoggedIn;
  User get user => _user;
  Dosen get dosen => _dosen;

  void login({Map creds}) async {
    print(creds);

    if (_isLoggedIn != null || _user != null && _dosen != null) {
      try {
        Dio.Response response =
            await dio().post('/sanctum/token/mahasiswa', data: creds);
        print(response.data.toString());

        String token = response.data.toString();
        this.tryToken(token: token);
      } catch (e) {
        print(e);
      }
    } else {
      try {
        Dio.Response response =
            await dio().post('/sanctum/token/dosen', data: creds);
        print(response.data.toString());
        String token = response.data.toString();
        this.tryToken(token: token);
      } catch (e) {
        print(e);
      }
    }
  }

  void tryToken({String token}) async {
    if (token == null) {
      return;
    } else {
      try {
        Dio.Response response = await dio().get('/user',
            options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
        this._isLoggedIn = true;
        this._user = User.fromJson(response.data);
        this._token = token;
        notifyListeners();
        print(_user);
      } catch (e) {
        print(e);
      }
    }
  }

  // void temptryToken({String token}) async {
  //   if (token == null) {
  //     return;
  //   } else {
  //     try {
  //       Dio.Response response = await dio().get('/dosen',
  //           options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
  //       this._isLoggedIn = true;
  //       this._dosen = Dosen.fromJson(response.data);
  //       this._token = token;
  //       notifyListeners();
  //       print(_dosen);
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }

  void logout() async {
    try {
      Dio.Response response = await dio().get('/user/revoke',
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
      cleanUp();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void cleanUp() async {
    this._user = null;
    this._dosen = null;
    this._isLoggedIn = false;
    this._token = null;
  }
}

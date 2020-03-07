import 'dart:convert';
import 'dart:io';

import 'package:cognifeed_app/login/login_response_model.dart';
import 'package:cognifeed_app/signup/signup_response_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../constants/cognifeed_constants.dart';

class UserRepository {
  Future<LoginResponseModel> authenticate({
    @required String email,
    @required String password,
  }) async {
    try {
      final response = await http.post("$baseUrl/users/login",
          body: {"email": email, "password": password});

      if ((jsonDecode(response.body) as Map).containsKey('error')) {
        return Future.error(jsonDecode(response.body)['error']);
      }
      return Future.value(
          LoginResponseModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }

  Future<SignupResponseModel> signup({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,
  }) async {
    try {
      final response = await http.post("$baseUrl/users/signup", body: {
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
      });

      if ((jsonDecode(response.body) as Map).containsKey('error')) {
        return Future.error(jsonDecode(response.body)['error']);
      }
      return Future.value(
          SignupResponseModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }

  void deleteToken() {
    Cognifeed.pref.remove('token');
    Cognifeed.pref.remove('name');
    Cognifeed.pref.remove('email');
    return;
  }

  void persistUser({
    @required String token,
    @required name,
    @required email,
    @required imageUrl,
  }) {
    Cognifeed.pref.setString('token', token);
    Cognifeed.pref.setString('name', name);
    Cognifeed.pref.setString('email', email);
    Cognifeed.pref.setString('imageUrl', imageUrl);
    return;
  }

  bool hasToken() {
    return Cognifeed.pref.containsKey('token');
  }
}

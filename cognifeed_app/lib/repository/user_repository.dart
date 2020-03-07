import 'dart:convert';
import 'dart:io';

import 'package:cognifeed_app/login/login_response_model.dart';
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

  Future<LoginResponseModel> signup({
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
          LoginResponseModel.fromJson(jsonDecode(response.body)));
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
    @required String about,
    @required String address,
    @required String bio,
    @required String email,
    @required String imageUrl,
    @required String name,
    @required String phone,
    @required String token,
    @required String website,
    @required String joinedDate,
  }) {
    Cognifeed.pref.setString("about", about);
    Cognifeed.pref.setString("address", address);
    Cognifeed.pref.setString("bio", bio);
    Cognifeed.pref.setString("email", email);
    Cognifeed.pref.setString("imageUrl", imageUrl);
    Cognifeed.pref.setString("name", name);
    Cognifeed.pref.setString("phone", phone);
    Cognifeed.pref.setString("token", token);
    Cognifeed.pref.setString("website", website);
    Cognifeed.pref.setString("joinedDate", joinedDate);
    return;
  }

  bool hasToken() {
    return Cognifeed.pref.containsKey('token');
  }
}

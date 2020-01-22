import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../constants/cognifeed_constants.dart';

class UserRepository {
  Future<String> authenticate({
    @required String email,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 3));
    try {
      final response = await http.post("$baseUrl/users/login",
          body: {"email": email, "password": password});

      if ((jsonDecode(response.body) as Map).containsKey('error')) {
        return Future.error(jsonDecode(response.body)['error']);
      }
      return Future.value(jsonDecode(response.body)['token']);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }

  Future<String> signup({
    @required String email,
    @required String password,
  }) async {
    try {
      final response = await http.post("$baseUrl/users/signup",
          body: {"email": email, "password": password, "name": "DUMMY NAME"});

      if ((jsonDecode(response.body) as Map).containsKey('error')) {
        return Future.error(jsonDecode(response.body)['error']);
      }
      return Future.value(jsonDecode(response.body)['token']);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }

  void deleteToken() {
    Cognifeed.pref.remove('token');
    return;
  }

  void persistToken(String token) {
    Cognifeed.pref.setString('token', token);
    return;
  }

  bool hasToken() {
    return Cognifeed.pref.containsKey('token');
  }
}

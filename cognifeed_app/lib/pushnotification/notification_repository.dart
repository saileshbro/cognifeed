import 'dart:io';

import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationRepository {
  static Future toggle() async {
    try {
      final response = await Cognifeed.dioClient.post(
        "$baseUrl/notification/toggle",
      );
      if (response.data.containsKey('error')) {
        return Future.error(response);
      }
      return Future.value(response);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      if (e is DioError) {
        return Future.error(e.response.data['error']);
      }
      return Future.error(e.toString());
    }
  }

  static Future status() async {
    try {
      final response = await Cognifeed.dioClient.get(
        "$baseUrl/notification/status",
      );
      if (response.data.containsKey('error')) {
        return Future.error(response);
      }
      return Future.value(response);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      if (e is DioError) {
        return Future.error(e.response.data['error']);
      }
      return Future.error(e.toString());
    }
  }

  static Future setTime({@required TimeOfDay time}) async {
    try {
      final response = await Cognifeed.dioClient.post(
          "$baseUrl/notification/set",
          data: {"time": "${time.hour}:${time.minute}"});
      if (response.data.containsKey('error')) {
        return Future.error(response);
      }
      return Future.value(response);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      if (e is DioError) {
        return Future.error(e.response.data['error']);
      }
      return Future.error(e.toString());
    }
  }
}

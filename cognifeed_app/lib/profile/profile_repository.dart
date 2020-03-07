import 'dart:convert';
import 'dart:io';

import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/profile/profile_response_model.dart';

class ProfileRepository {
  static Future<ProfileResponseModel> getUserProfile() async {
    try {
      final response = await Cognifeed.dioClient.get("$baseUrl/users/profile");
      print(response.data);
      if ((response.data as Map).containsKey('error')) {
        return Future.error(response.data);
      }
      return Future.value(ProfileResponseModel.fromJson(response.data));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }
}
